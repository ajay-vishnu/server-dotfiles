local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_textzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {
	-- all snippets in text mode
	s(
		"beg",
		fmta(
			[[
                \begin{<>}[<>]
                    <>
                \end{<>}
            ]],
			{ i(1), i(2), i(3), rep(1) }
		)
	),

	-- Gateway to the ender world
	s({ trig = "mk", snippetType = "autosnippet" }, fmta("$ <> $", { i(1) }), { condition = in_textzone }),

	s(
		{ trig = "dm", snippetType = "autosnippet" },
		fmta(
			[[
            $$
                <>
            $$
            ]],
			{ i(1) }
		),
		{ condition = in_textzone }
	),
}
