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

            const <> = (<>) =>> {
                return (
                    <<div>><><</div>>
                )
            }

            export default <>
            ]],
			{
				i(1, current_class_name()),
				c(2, {
					i(1),
					sn(nil, fmta([[{ params } : { params: { ]] .. get_param() .. [[: <> }}]], { i(1) })),
					sn(nil, { t("{ children } : { children: React.ReactNode }"), i(1) }),
				}),
				i(3, rep(1)),
				rep(1),
			}
		)
	),

	-- Defining attribute snippets
	s({ trig = "(%w+)<", wordTrig = false, regTrig = false, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "<" .. snip.captures[1] .. ">"
		end),
		i(1),
		f(function(_, snip)
			return "</" .. snip.captures[1] .. ">"
		end),
	}),
	s({ trig = "(%w+)/<", wordTrig = false, regTrig = false, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "<" .. snip.captures[1] .. "/>"
		end),
	}),

	-- Defining hooks
	s({ trig = "sthk", snippetType = "autosnippet" }, fmta("const [<>, set<>] = useState(<>);", { i(1), i(2), i(2) })),

	-- Defining console commands
	s({ trig = "clog", snippetType = "autosnippet" }, fmta("console.log(<>)", { i(1) })),
	s({ trig = "cwarn", snippetType = "autosnippet" }, fmta("console.warn(<>)", { i(1) })),
	s({ trig = "cinfo", snippetType = "autosnippet" }, fmta("console.info(<>)", { i(1) })),

	-- Defining attribute snippets
	s({ trig = "cname", snippetType = "autosnippet" }, fmta('className="<>"', { i(1) })),

	-- Defining code blocks
	s(
		{ trig = "([%u_]+) ", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		f(function(_, snip)
			return "{/* " .. snip.captures[1] .. " */}"
		end)
	),
}
