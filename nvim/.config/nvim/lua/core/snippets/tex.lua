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

	-- all snippets in math mode
	-- Greek letters
	s({ trig = "@a", snippetType = "autosnippet" }, t("\\alpha"), { condition = in_mathzone }),
	s({ trig = "@b", snippetType = "autosnippet" }, t("\\beta"), { condition = in_mathzone }),
	s({ trig = "@g", snippetType = "autosnippet" }, t("\\gamma"), { condition = in_mathzone }),
	s({ trig = "@G", snippetType = "autosnippet" }, t("\\Gamma"), { condition = in_mathzone }),
	s({ trig = "@d", snippetType = "autosnippet" }, t("\\delta"), { condition = in_mathzone }),
	s({ trig = "@D", snippetType = "autosnippet" }, t("\\Delta"), { condition = in_mathzone }),
	s({ trig = "@e", snippetType = "autosnippet" }, t("\\epsilon"), { condition = in_mathzone }),
	s({ trig = ":e", snippetType = "autosnippet" }, t("\\varepsilon"), { condition = in_mathzone }),
	s({ trig = "@z", snippetType = "autosnippet" }, t("\\zeta"), { condition = in_mathzone }),
	s({ trig = "@t", snippetType = "autosnippet" }, t("\\theta"), { condition = in_mathzone }),
	s({ trig = "@T", snippetType = "autosnippet" }, t("\\Theta"), { condition = in_mathzone }),
	s({ trig = ":t", snippetType = "autosnippet" }, t("\\vartheta"), { condition = in_mathzone }),
	s({ trig = "@i", snippetType = "autosnippet" }, t("\\iota"), { condition = in_mathzone }),
	s({ trig = "@k", snippetType = "autosnippet" }, t("\\kappa"), { condition = in_mathzone }),
	s({ trig = "@l", snippetType = "autosnippet" }, t("\\lambda"), { condition = in_mathzone }),
	s({ trig = "@L", snippetType = "autosnippet" }, t("\\Lambda"), { condition = in_mathzone }),
	s({ trig = "@s", snippetType = "autosnippet" }, t("\\sigma"), { condition = in_mathzone }),
	s({ trig = "@S", snippetType = "autosnippet" }, t("\\Sigma"), { condition = in_mathzone }),
	s({ trig = "@u", snippetType = "autosnippet" }, t("\\upsilon"), { condition = in_mathzone }),
	s({ trig = "@U", snippetType = "autosnippet" }, t("\\Upsilon"), { condition = in_mathzone }),
	s({ trig = "@o", snippetType = "autosnippet" }, t("\\omega"), { condition = in_mathzone }),
	s({ trig = "@O", snippetType = "autosnippet" }, t("\\Omega"), { condition = in_mathzone }),
	s({ trig = "ome", snippetType = "autosnippet" }, t("\\omega"), { condition = in_mathzone }),
	s({ trig = "Ome", snippetType = "autosnippet" }, t("\\Omega"), { condition = in_mathzone }),

	-- Text snippets
	s({ trig = "text", snippetType = "autosnippet" }, fmta("\\text{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = '"', snippetType = "autosnippet" }, fmta("\\text{<>}", { i(1) }), { condition = in_mathzone }),

	-- Basic operations
	s({ trig = "sr", snippetType = "autosnippet" }, t("^{2}"), { condtion = in_mathzone }),
	s({ trig = "cb", snippetType = "autosnippet" }, t("^{3}"), { condtion = in_mathzone }),
	s({ trig = "rd", snippetType = "autosnippet" }, fmta("^{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "_", snippetType = "autosnippet" }, fmta("_{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "sts", snippetType = "autosnippet" }, fmta("_\\text{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "sq", snippetType = "autosnippet" }, fmta("\\sqrt{ <> }", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "//", snippetType = "autosnippet" }, fmta("\\frac{<>}{<>}", { i(1), i(2) }), { condtion = in_mathzone }),
	s({ trig = "ee", snippetType = "autosnippet" }, fmta("e^{ <> }", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "invs", snippetType = "autosnippet" }, t("^{-1}"), { condtion = in_mathzone }),
	-- s({trig=/([A-Za-z])(\d)/, snippetType="autosnippet"}, fmta("[[0]]_{[[1]]}", options: "rmA", description: "Auto letter subscript", priority: -1},
	-- s({trig=/([^\\])(exp|log|ln)/, snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", { }), {condtion=in_mathzone}),
	s({ trig = "conj", snippetType = "autosnippet" }, t("^{*}"), { condtion = in_mathzone }),
	s({ trig = "Re", snippetType = "autosnippet" }, t("\\mathrm{Re}"), { condtion = in_mathzone }),
	s({ trig = "Im", snippetType = "autosnippet" }, t("\\mathrm{Im}"), { condtion = in_mathzone }),
	s({ trig = "bf", snippetType = "autosnippet" }, fmta("\\mathbf{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "rm", snippetType = "autosnippet" }, fmta("\\mathrm{<>}", { i(1) }), { condtion = in_mathzone }),

	-- Linear algebra
	-- s({trig=/([^\\])(det)/, snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", { }), {condtion=in_mathzone}),
	s({ trig = "trace", snippetType = "autosnippet" }, t("\\mathrm{Tr}"), { condtion = in_mathzone }),

	-- More operations
	-- s({trig="([a-zA-Z])hat", snippetType="autosnippet"}, fmta("\\hat{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z])bar", snippetType="autosnippet"}, fmta("\\bar{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z])dot", snippetType="autosnippet"}, fmta("\\dot{[[0]]}", options: "rmA", priority: -1},
	-- s({trig="([a-zA-Z])ddot", snippetType="autosnippet"}, fmta("\\ddot{[[0]]}", options: "rmA", priority: 1},
	-- s({trig="([a-zA-Z])tilde", snippetType="autosnippet"}, fmta("\\tilde{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z])und", snippetType="autosnippet"}, fmta("\\underline{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z])vec", snippetType="autosnippet"}, fmta("\\vec{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z]),\\.", snippetType="autosnippet"}, fmta("\\mathbf{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="([a-zA-Z])\\.,", snippetType="autosnippet"}, fmta("\\mathbf{[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}),\\.", snippetType="autosnippet"}, fmta("\\boldsymbol{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK})\\.,", snippetType="autosnippet"}, fmta("\\boldsymbol{\\[[0]]}", { }), {condtion=in_mathzone}),
	s({ trig = "hat", snippetType = "autosnippet" }, fmta("\\hat{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "bar", snippetType = "autosnippet" }, fmta("\\bar{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "dot", snippetType = "autosnippet" }, fmta("\\dot{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "ddot", snippetType = "autosnippet" }, fmta("\\ddot{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "cdot", snippetType = "autosnippet" }, t("\\cdot"), { condtion = in_mathzone }),
	s({ trig = "tilde", snippetType = "autosnippet" }, fmta("\\tilde{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "und", snippetType = "autosnippet" }, fmta("\\underline{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "vec", snippetType = "autosnippet" }, fmta("\\vec{<>}", { i(1) }), { condtion = in_mathzone }),

	-- More auto letter subscript
	-- s({trig=/([A-Za-z])_(\d\d)/, snippetType="autosnippet"}, fmta("[[0]]_{[[1]]}", { }), {condtion=in_mathzone}),
	-- s({trig=/\\hat{([A-Za-z])}(\d)/, snippetType="autosnippet"}, fmta("\\hat{[[0]]}_{[[1]]}", { }), {condtion=in_mathzone}),
	-- s({trig=/\\vec{([A-Za-z])}(\d)/, snippetType="autosnippet"}, fmta("\\vec{[[0]]}_{[[1]]}", { }), {condtion=in_mathzone}),
	-- s({trig=/\\mathbf{([A-Za-z])}(\d)/, snippetType="autosnippet"}, fmta("\\mathbf{[[0]]}_{[[1]]}", { }), {condtion=in_mathzone}),
	s({ trig = "xnn", snippetType = "autosnippet" }, t("x_{n}"), { condtion = in_mathzone }),
	s({ trig = "xii", snippetType = "autosnippet" }, t("x_{i}"), { condtion = in_mathzone }),
	s({ trig = "xjj", snippetType = "autosnippet" }, t("x_{j}"), { condtion = in_mathzone }),
	s({ trig = "xp1", snippetType = "autosnippet" }, t("x_{n+1}"), { condtion = in_mathzone }),
	s({ trig = "ynn", snippetType = "autosnippet" }, t("y_{n}"), { condtion = in_mathzone }),
	s({ trig = "yii", snippetType = "autosnippet" }, t("y_{i}"), { condtion = in_mathzone }),
	s({ trig = "yjj", snippetType = "autosnippet" }, t("y_{j}"), { condtion = in_mathzone }),

	-- Symbols
	s({ trig = "ooo", snippetType = "autosnippet" }, t("\\infty"), { condtion = in_mathzone }),
	s({ trig = "sum", snippetType = "autosnippet" }, t("\\sum"), { condtion = in_mathzone }),
	s({ trig = "prod", snippetType = "autosnippet" }, t("\\prod"), { condtion = in_mathzone }),
	s(
		{ trig = "\\sum", snippetType = "autosnippet" },
		fmta("\\sum_{<>=<>}^{<>}", { i(1, "i"), i(2, "1"), i(3, "N") }),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "\\prod", snippetType = "autosnippet" },
		fmta("\\prod_{<>=<>}^{<>}", { i(1, "i"), i(2, "1"), i(3, "N") }),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "lim", snippetType = "autosnippet" },
		fmta("\\lim_{ <> \\to <>} }", { i(1, "n"), i(2, "\\infty") }),
		{ condtion = in_mathzone }
	),
	s({ trig = "+-", snippetType = "autosnippet" }, t("\\pm"), { condtion = in_mathzone }),
	s({ trig = "-+", snippetType = "autosnippet" }, t("\\mp"), { condtion = in_mathzone }),
	s({ trig = "...", snippetType = "autosnippet" }, t("\\dots"), { condtion = in_mathzone }),
	s({ trig = "nabl", snippetType = "autosnippet" }, t("\\nabla"), { condtion = in_mathzone }),
	s({ trig = "del", snippetType = "autosnippet" }, t("\\nabla"), { condtion = in_mathzone }),
	s({ trig = "xx", snippetType = "autosnippet" }, t("\\times"), { condtion = in_mathzone }),
	s({ trig = "**", snippetType = "autosnippet" }, t("\\cdot"), { condtion = in_mathzone }),
	s({ trig = "para", snippetType = "autosnippet" }, t("\\parallel"), { condtion = in_mathzone }),
	s({ trig = "===", snippetType = "autosnippet" }, t("\\equiv"), { condtion = in_mathzone }),
	s({ trig = "!=", snippetType = "autosnippet" }, t("\\neq"), { condtion = in_mathzone }),
	s({ trig = ">=", snippetType = "autosnippet" }, t("\\geq"), { condtion = in_mathzone }),
	s({ trig = "<=", snippetType = "autosnippet" }, t("\\leq"), { condtion = in_mathzone }),
	s({ trig = ">>", snippetType = "autosnippet" }, t("\\gg"), { condtion = in_mathzone }),
	s({ trig = "<<", snippetType = "autosnippet" }, t("\\ll"), { condtion = in_mathzone }),
	s({ trig = "simm", snippetType = "autosnippet" }, t("\\sim"), { condtion = in_mathzone }),
	s({ trig = "sim=", snippetType = "autosnippet" }, t("\\simeq"), { condtion = in_mathzone }),
	s({ trig = "prop", snippetType = "autosnippet" }, t("\\propto"), { condtion = in_mathzone }),
	s({ trig = "<->", snippetType = "autosnippet" }, t("\\leftrightarrow "), { condtion = in_mathzone }),
	s({ trig = "->", snippetType = "autosnippet" }, t("\\to"), { condtion = in_mathzone }),
	s({ trig = "!>", snippetType = "autosnippet" }, t("\\mapsto"), { condtion = in_mathzone }),
	s({ trig = "=>", snippetType = "autosnippet" }, t("\\implies"), { condtion = in_mathzone }),
	s({ trig = "=<", snippetType = "autosnippet" }, t("\\impliedby"), { condtion = in_mathzone }),
	s({ trig = "and", snippetType = "autosnippet" }, t("\\cap"), { condtion = in_mathzone }),
	s({ trig = "orr", snippetType = "autosnippet" }, t("\\cup"), { condtion = in_mathzone }),
	s({ trig = "inn", snippetType = "autosnippet" }, t("\\in"), { condtion = in_mathzone }),
	s({ trig = "notin", snippetType = "autosnippet" }, t("\\not\\in"), { condtion = in_mathzone }),
	s({ trig = "\\\\\\", snippetType = "autosnippet" }, t("\\setminus"), { condtion = in_mathzone }),
	s({ trig = "sub=", snippetType = "autosnippet" }, t("\\subseteq"), { condtion = in_mathzone }),
	s({ trig = "sup=", snippetType = "autosnippet" }, t("\\supseteq"), { condtion = in_mathzone }),
	s({ trig = "eset", snippetType = "autosnippet" }, t("\\emptyset"), { condtion = in_mathzone }),
	s({ trig = "set", snippetType = "autosnippet" }, fmta("\\{ <> \\}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "e\\xi sts", snippetType = "autosnippet" }, t("\\exists"), { condtion = in_mathzone }),
	s({ trig = "LL", snippetType = "autosnippet" }, t("\\mathcal{L}"), { condtion = in_mathzone }),
	s({ trig = "HH", snippetType = "autosnippet" }, t("\\mathcal{H}"), { condtion = in_mathzone }),
	s({ trig = "CC", snippetType = "autosnippet" }, t("\\mathbb{C}"), { condtion = in_mathzone }),
	s({ trig = "RR", snippetType = "autosnippet" }, t("\\mathbb{R}"), { condtion = in_mathzone }),
	s({ trig = "ZZ", snippetType = "autosnippet" }, t("\\mathbb{Z}"), { condtion = in_mathzone }),
	s({ trig = "NN", snippetType = "autosnippet" }, t("\\mathbb{N}"), { condtion = in_mathzone }),

	-- Handle spaces and backslashes

	-- Snippet variables can be used as shortcuts when writing snippets.

	-- For example, ${GREEK} below is shorthand for "alpha|beta|gamma|Gamma|delta|..."

	-- -- You can edit snippet variables under the Advanced snippet settings section.
	-- s({trig="([^\\\\])(${GREEK})", snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before Greek letters"},
	-- s({trig="([^\\\\])(${SYMBOL})", snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before symbols"},

	-- -- Insert space after Greek letters and symbols
	-- s({trig="\\\\(${GREEK}|${SYMBOL}|${MORE_SYMBOLS})([A-Za-z])", snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) sr", snippetType="autosnippet"}, fmta("\\[[0]]^{2}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) cb", snippetType="autosnippet"}, fmta("\\[[0]]^{3}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) rd", snippetType="autosnippet"}, fmta("\\[[0]]^{$0}$1", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) hat", snippetType="autosnippet"}, fmta("\\hat{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) dot", snippetType="autosnippet"}, fmta("\\dot{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) bar", snippetType="autosnippet"}, fmta("\\bar{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) vec", snippetType="autosnippet"}, fmta("\\vec{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) tilde", snippetType="autosnippet"}, fmta("\\tilde{\\[[0]]}", { }), {condtion=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) und", snippetType="autosnippet"}, fmta("\\underline{\\[[0]]}", { }), {condtion=in_mathzone}),

	-- Derivatives and integrals
	-- s({trig="par", snippetType="autosnippet"}, fmta("\\frac{ \\partial ${0:y} }{ \\partial ${1:x} } $2", { }), {condtion=in_mathzone}),
	-- s({trig=/pa([A-Za-z])([A-Za-z])/, snippetType="autosnippet"}, fmta("\\frac{ \\partial [[0]] }{ \\partial [[1]] } ", { }), {condtion=in_mathzone}),
	s({ trig = "ddt", snippetType = "autosnippet" }, t("\\frac{d}{dt} "), { condtion = in_mathzone }),
	-- s({trig=/([^\\])int/, snippetType="autosnippet"}, fmta("[[0]]\\int", options: "mA", priority: -1},
	s(
		{ trig = "\\int", snippetType = "autosnippet" },
		fmta("\\int <> \\, d<>", { i(1), i(2, "x") }),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "dint", snippetType = "autosnippet" },
		fmta("\\int_{<>}^{<>} <> \\, d<>", { i(1, "0"), i(2, "1"), i(3), i(4, "x") }),
		{ condtion = in_mathzone }
	),
	s({ trig = "oint", snippetType = "autosnippet" }, t("\\oint"), { condtion = in_mathzone }),
	s({ trig = "iint", snippetType = "autosnippet" }, t("\\iint"), { condtion = in_mathzone }),
	s({ trig = "iiint", snippetType = "autosnippet" }, t("\\iiint"), { condtion = in_mathzone }),
	s(
		{ trig = "oinf", snippetType = "autosnippet" },
		fmta("\\int_{0}^{\\infty} <> \\, d<>", { i(1), i(2, "x") }),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "infi", snippetType = "autosnippet" },
		fmta("\\int_{-\\infty}^{\\infty} <> \\, d<>", { i(1), i(2, "x") }),
		{ condtion = in_mathzone }
	),

	-- -- Trigonometry
	-- feels redundant
	-- s({trig=/([^\\])(arcsin|sin|arccos|cos|arctan|tan|csc|sec|cot)/, snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before trig funcs"},
	-- s({trig=/\\(arcsin|sin|arccos|cos|arctan|tan|csc|sec|cot)([A-Za-gi-z])/,
	-- snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", options: "rmA",
	-- description: "Add space after trig funcs. Skips letter h to allow sinh, cosh, etc."},
	-- s({trig=/\\(sinh|cosh|tanh|coth)([A-Za-z])/,
	-- snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", options: "rmA",
	-- description: "Add space after hyperbolic trig funcs"},

	-- -- Visual operations
	-- found no usecase
	-- s({trig="U", snippetType="autosnippet"}, fmta("\\underbrace{ ${VISUAL} }_{ $0 }", { }), {condtion=in_mathzone}),
	-- s({trig="O", snippetType="autosnippet"}, fmta("\\overbrace{ ${VISUAL} }^{ $0 }", { }), {condtion=in_mathzone}),
	-- s({trig="B", snippetType="autosnippet"}, fmta("\\underset{ $0 }{ ${VISUAL} }", { }), {condtion=in_mathzone}),
	-- s({trig="C", snippetType="autosnippet"}, fmta("\\cancel{ ${VISUAL} }", { }), {condtion=in_mathzone}),
	-- s({trig="K", snippetType="autosnippet"}, fmta("\\cancelto{ $0 }{ ${VISUAL} }", { }), {condtion=in_mathzone}),
	-- s({trig="S", snippetType="autosnippet"}, fmta("\\sqrt{ ${VISUAL} }", { }), {condtion=in_mathzone}),

	-- Physics
	-- won't be using these
	-- s({ trig = "kbt", snippetType = "autosnippet" }, fmta("k_{B}T", {}), { condtion = in_mathzone }),
	-- s({ trig = "msun", snippetType = "autosnippet" }, fmta("M_{\\odot}", {}), { condtion = in_mathzone }),

	-- -- Quantum mechanics
	-- won't be using these
	-- s({trig="dag", snippetType="autosnippet"}, fmta("^{\\dagger}", { }), {condtion=in_mathzone}),
	-- s({trig="o+", snippetType="autosnippet"}, fmta("\\oplus ", { }), {condtion=in_mathzone}),
	-- s({trig="ox", snippetType="autosnippet"}, fmta("\\otimes ", { }), {condtion=in_mathzone}),
	-- s({trig="bra", snippetType="autosnippet"}, fmta("\\bra{$0} $1", { }), {condtion=in_mathzone}),
	-- s({trig="ket", snippetType="autosnippet"}, fmta("\\ket{$0} $1", { }), {condtion=in_mathzone}),
	-- s({trig="brk", snippetType="autosnippet"}, fmta("\\braket{ $0 | $1 } $2", { }), {condtion=in_mathzone}),
	-- s({trig="outer", snippetType="autosnippet"}, fmta("\\ket{${0:\\psi}} \\bra{${0:\\psi}} $1", { }), {condtion=in_mathzone}),

	-- -- Chemistry
	-- won't be using these
	-- s({trig="pu", snippetType="autosnippet"}, fmta("\\pu{ $0 }", { }), {condtion=in_mathzone}),
	-- s({trig="cee", snippetType="autosnippet"}, fmta("\\ce{ $0 }", { }), {condtion=in_mathzone}),
	-- s({trig="he4", snippetType="autosnippet"}, fmta("{}^{4}_{2}He ", { }), {condtion=in_mathzone}),
	-- s({trig="he3", snippetType="autosnippet"}, fmta("{}^{3}_{2}He ", { }), {condtion=in_mathzone}),
	-- s({trig="iso", snippetType="autosnippet"}, fmta("{}^{${0:4}}_{${1:2}}${2:He}", { }), {condtion=in_mathzone}),

	-- Environments
	s(
		{ trig = "pmat", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{pmatrix}
			<>
		\end{pmatrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "bmat", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{bmatrix}
			<>
		\end{bmatrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "Bmat", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{Bmatrix}
			<>
		\end{Bmatrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "vmat", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{vmatrix}
			<>
		\end{vmatrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "Vmat", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{Vmatrix}
			<>
		\end{Vmatrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "matrix", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{matrix}
			<>
		\end{matrix}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),

	-- This should be triggered when in inline math mode
	-- s({trig="pmat", snippetType="autosnippet"}, fmta([[\begin{pmatrix}<>\end{pmatrix}]], {i(1)}), {condtion=in_mathzone}),
	-- s({trig="bmat", snippetType="autosnippet"}, fmta([[\begin{bmatrix}<>\end{bmatrix}]], {i(1)}), {condtion=in_mathzone}),
	-- s({trig="Bmat", snippetType="autosnippet"}, fmta( [[\begin{Bmatrix}<>\end{Bmatrix}]], {i(1)}), {condtion=in_mathzone}),
	-- s({trig="vmat", snippetType="autosnippet"}, fmta( [[\begin{vmatrix}<>\end{vmatrix}]], {i(1)}), {condtion=in_mathzone}),
	-- s({trig="Vmat", snippetType="autosnippet"}, fmta( [[\begin{Vmatrix}<>\end{Vmatrix}]], {i(1)}), {condtion=in_mathzone}),
	-- s({trig="matrix", snippetType="autosnippet"}, fmta([[\begin{matrix}<>\end{matrix}]], {i(1)}), {condtion=in_mathzone}),

	s(
		{ trig = "cases", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{cases}
			<>
		\end{cases}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "align", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{align}
			<>
		\end{align}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),
	s(
		{ trig = "array", snippetType = "autosnippet" },
		fmta(
			[[
		\begin{array}
			<>
		\end{array}
	]],
			{ i(1) }
		),
		{ condtion = in_mathzone }
	),

	-- Brackets
	s(
		{ trig = "avg", snippetType = "autosnippet" },
		fmta("\\langle <> \\rangle", { i(1) }),
		{ condtion = in_mathzone }
	),
	s({ trig = "norm", snippetType = "autosnippet" }, fmta("\\lvert <> \\rvert", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "Norm", snippetType = "autosnippet" }, fmta("\\lVert <> \\rVert", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "ceil", snippetType = "autosnippet" }, fmta("\\lceil <> \\rceil", { i(1) }), { condtion = in_mathzone }),
	s(
		{ trig = "floor", snippetType = "autosnippet" },
		fmta("\\lfloor <> \\rfloor", { i(1) }),
		{ condtion = in_mathzone }
	),
	s({ trig = "mod", snippetType = "autosnippet" }, fmta("|<>|", { i(1) }), { condtion = in_mathzone }),
	-- s({trig="(", snippetType="autosnippet"}, fmta("(${VISUAL})", {i(1)}), {condtion=in_mathzone}),
	-- s({trig="[", snippetType="autosnippet"}, fmta("[${VISUAL}]", {i(1)}), {condtion=in_mathzone}),
	-- s({trig="{", snippetType="autosnippet"}, fmta("{${VISUAL}}", {i(1)}), {condtion=in_mathzone}),
	s({ trig = "(", snippetType = "autosnippet" }, fmta("(<>)", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "{", snippetType = "autosnippet" }, fmta("{<>}", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "[", snippetType = "autosnippet" }, fmta("[<>]", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "lr(", snippetType = "autosnippet" }, fmta("\\left( <> \\right)", { i(1) }), { condtion = in_mathzone }),
	s(
		{ trig = "lr{", snippetType = "autosnippet" },
		fmta("\\left\\{ <> \\right\\}", { i(1) }),
		{ condtion = in_mathzone }
	),
	s({ trig = "lr[", snippetType = "autosnippet" }, fmta("\\left[ <> \\right]", { i(1) }), { condtion = in_mathzone }),
	s({ trig = "lr|", snippetType = "autosnippet" }, fmta("\\left| <> \\right|", { i(1) }), { condtion = in_mathzone }),
	s(
		{ trig = "lra", snippetType = "autosnippet" },
		fmta("\\left<< <> \\right>>", { i(1) }),
		{ condtion = in_mathzone }
	),
}
