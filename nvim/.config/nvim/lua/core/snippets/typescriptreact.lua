local current_class_name = function()
	local base_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
	local name_without_extension = base_name:gsub("%.%w+$", "")
	return name_without_extension:sub(1, 1):upper() .. name_without_extension:sub(2)
end

local get_param = function()
	local file_name = vim.split(vim.api.nvim_buf_get_name(0), "/", true)

	if not file_name or #file_name == 0 then
		Snacks.notifier.notify("Looks like you haven't saved the file", "warn")
		return "id"
	end

	local param_name = file_name[#file_name - 1]:gsub("[%[%]]", "")

	return param_name
end

return {
	-- Defining class snippets
	s(
		{ trig = "ccomp", snippetType = "snippet" },
		fmta(
			[[
            "use <>"

            function <>()   {

                return (
                    <>
                );
            }
            
            export default <>;
            ]],
			{
				i(1),
				i(2, current_class_name()),
				i(3),
				rep(2),
			}
		)
	),
	s(
		{ trig = "rafce", snippetType = "snippet" },
		fmta(
			[[
            import React from 'react'

            const Page = (<>) =>> {
                return (
                    <<div>><><</div>>
                )
            }

            export default Page
            ]],
			{
				c(1, {
					i(1),
					sn(nil, fmta([[{ params } : { params: { ]] .. get_param() .. [[: <> }}]], { i(1) })),
				}),
				i(2, "Page"),
			}
		)
	),

	-- Defining attribute snippet
	s({ trig = "(%w+)<", wordTrig = false, regTrig = false, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "<" .. snip.captures[1] .. ">"
		end),
		i(1),
		f(function(_, snip)
			return "</" .. snip.captures[1] .. ">"
		end),
	}),
	s({ trig = "(%w+)<<", wordTrig = false, regTrig = false, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "<" .. snip.captures[1] .. "/>"
		end),
	}),

	-- Defining console commands
	s({ trig = "log", snippetType = "autosnippet" }, fmta("console.log(<>)", { i(1) })),
}
