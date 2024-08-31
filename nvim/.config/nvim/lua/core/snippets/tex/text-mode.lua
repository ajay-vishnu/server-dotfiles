local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
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
			{
				i(1),
				i(2),
				i(3),
				rep(4),
			}
		)
	),

	s({ trig = "mk", snippetType = "autosnippet" }, fmta("$ <> $", { i(1) }), { condition = not in_mathzone }),

	s(
		{ trig = "dmk", snippetType = "autosnippet" },
		fmta(
			[[
            $$
                <>
            $$
            ]],
			{ i(1) }
		),
		{ condition = not in_mathzone }
	),
}
