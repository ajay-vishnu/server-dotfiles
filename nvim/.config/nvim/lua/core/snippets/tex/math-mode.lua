local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
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
	s({ trig = '""', snippetType = "autosnippet" }, fmta("\\text{<>}", { i(1) }), { condition = in_mathzone }),

	-- Basic operations
	s({ trig = "sr", snippetType = "autosnippet" }, t("^{2}"), { condition = in_mathzone }),
	s({ trig = "cb", snippetType = "autosnippet" }, t("^{3}"), { condition = in_mathzone }),
	s({ trig = "rd", snippetType = "autosnippet" }, fmta("^{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "_", snippetType = "autosnippet" }, fmta("_{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "sts", snippetType = "autosnippet" }, fmta("_\\text{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "sq", snippetType = "autosnippet" }, fmta("\\sqrt{ <> }", { i(1) }), { condition = in_mathzone }),
	s(
		{ trig = "//", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),
	s({ trig = "ee", snippetType = "autosnippet" }, fmta("e^{ <> }", { i(1) }), { condition = in_mathzone }),
	s({ trig = "invs", snippetType = "autosnippet" }, t("^{-1}"), { condition = in_mathzone }),

	s({ trig = "(%u)_(%l)", regTrig = true, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end),
	}, { condition = in_mathzone }),

	s({ trig = "conj", snippetType = "autosnippet" }, t("^{*}"), { condition = in_mathzone }),
	s({ trig = "Re", snippetType = "autosnippet" }, t("\\mathrm{Re}"), { condition = in_mathzone }),
	s({ trig = "Im", snippetType = "autosnippet" }, t("\\mathrm{Im}"), { condition = in_mathzone }),
	s({ trig = "bf", snippetType = "autosnippet" }, fmta("\\mathbf{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "rm", snippetType = "autosnippet" }, fmta("\\mathrm{<>}", { i(1) }), { condition = in_mathzone }),

	-- Linear algebra
	s({ trig = "trace", snippetType = "autosnippet" }, t("\\mathrm{Tr}"), { condition = in_mathzone }),

	-- More operations
	s({ trig = "(%a)hat", regTrig = true, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "\\hat{" .. snip.captures[1] .. "}"
		end),
	}, { condition = in_mathzone }),
	s({ trig = "(%a)bar", regTrig = true, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "\\bar{" .. snip.captures[1] .. "}"
		end),
	}, { condition = in_mathzone }),
	s(
		{ trig = "(%a)dot", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\dot{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a)ddot", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\ddot{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a)tilde", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\tilde{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a)und", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\und{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a)vec", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\vec{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a),\\.", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\mathbf{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "(%a)\\.,", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\mathbf{" .. snip.captures[1] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	-- s({trig="\\\\(${GREEK}),\\.", snippetType="autosnippet"}, fmta("\\boldsymbol{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK})\\.,", snippetType="autosnippet"}, fmta("\\boldsymbol{\\[[0]]}", { }), {condition=in_mathzone}),
	s({ trig = "hat", snippetType = "autosnippet" }, fmta("\\hat{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "bar", snippetType = "autosnippet" }, fmta("\\bar{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "dot", snippetType = "autosnippet" }, fmta("\\dot{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "ddot", snippetType = "autosnippet" }, fmta("\\ddot{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "cdot", snippetType = "autosnippet" }, t("\\cdot"), { condition = in_mathzone }),
	s({ trig = "tilde", snippetType = "autosnippet" }, fmta("\\tilde{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "und", snippetType = "autosnippet" }, fmta("\\underline{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "vec", snippetType = "autosnippet" }, fmta("\\vec{<>}", { i(1) }), { condition = in_mathzone }),

	-- More auto letter subscript
	s(
		{ trig = "(%a)_(%d%d)", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "\\hat{(%a)}(%d)", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\hat{" .. snip.captures[1] .. "}_{" .. snip.captures[2] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "\\vec{(%a)}(%d)", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\vec{" .. snip.captures[1] .. "}_{" .. snip.captures[2] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "\\mathbf{(%a)}(%d)", regTrig = true, snippetType = "autosnippet" },
		{ f(function(_, snip)
			return "\\mathbf{" .. snip.captures[1] .. "}_{" .. snip.captures[2] .. "}"
		end) },
		{ condition = in_mathzone }
	),
	s({ trig = "xnn", snippetType = "autosnippet" }, t("x_{n}"), { condition = in_mathzone }),
	s({ trig = "xii", snippetType = "autosnippet" }, t("x_{i}"), { condition = in_mathzone }),
	s({ trig = "xjj", snippetType = "autosnippet" }, t("x_{j}"), { condition = in_mathzone }),
	s({ trig = "xp1", snippetType = "autosnippet" }, t("x_{n+1}"), { condition = in_mathzone }),
	s({ trig = "ynn", snippetType = "autosnippet" }, t("y_{n}"), { condition = in_mathzone }),
	s({ trig = "yii", snippetType = "autosnippet" }, t("y_{i}"), { condition = in_mathzone }),
	s({ trig = "yjj", snippetType = "autosnippet" }, t("y_{j}"), { condition = in_mathzone }),

	-- symbols
	s({ trig = "ooo", snippettype = "autosnippet" }, t("\\infty"), { condition = in_mathzone }),
	s(
		"sum",
		{ c(1, { t("\\sum"), fmta("\\sum_{<>=<>}^{<>}", { i(1, "i"), i(2, "1"), i(3, "n") }) }) },
		{ condition = in_mathzone }
	),
	s(
		"prod",
		{ c(1, { t("\\prod"), fmta("\\prod_{<>=<>}^{<>}", { i(1, "i"), i(2, "1"), i(3, "N") }) }) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lim", snippetType = "autosnippet" },
		fmta("\\lim_{ <> \\to <> }", { i(1, "n"), i(2, "\\infty") }),
		{ condition = in_mathzone }
	),
	s({ trig = "+-", snippetType = "autosnippet" }, t("\\pm"), { condition = in_mathzone }),
	s({ trig = "-+", snippetType = "autosnippet" }, t("\\mp"), { condition = in_mathzone }),
	s({ trig = "...", snippetType = "autosnippet" }, t("\\dots"), { condition = in_mathzone }),
	s({ trig = "nabl", snippetType = "autosnippet" }, t("\\nabla"), { condition = in_mathzone }),
	s({ trig = "del", snippetType = "autosnippet" }, t("\\nabla"), { condition = in_mathzone }),
	s({ trig = "xx", snippetType = "autosnippet" }, t("\\times"), { condition = in_mathzone }),
	s({ trig = "**", snippetType = "autosnippet" }, t("\\cdot"), { condition = in_mathzone }),
	s({ trig = "para", snippetType = "autosnippet" }, t("\\parallel"), { condition = in_mathzone }),
	s({ trig = "===", snippetType = "autosnippet" }, t("\\equiv"), { condition = in_mathzone }),
	s({ trig = "!=", snippetType = "autosnippet" }, t("\\neq"), { condition = in_mathzone }),
	s({ trig = ">=", snippetType = "autosnippet" }, t("\\geq"), { condition = in_mathzone }),
	s({ trig = "<=", snippetType = "autosnippet" }, t("\\leq"), { condition = in_mathzone }),
	s({ trig = ">>", snippetType = "autosnippet" }, t("\\gg"), { condition = in_mathzone }),
	s({ trig = "<<", snippetType = "autosnippet" }, t("\\ll"), { condition = in_mathzone }),
	s({ trig = "simm", snippetType = "autosnippet" }, t("\\sim"), { condition = in_mathzone }),
	s({ trig = "sim=", snippetType = "autosnippet" }, t("\\simeq"), { condition = in_mathzone }),
	s({ trig = "prop", snippetType = "autosnippet" }, t("\\propto"), { condition = in_mathzone }),
	s({ trig = "<->", snippetType = "autosnippet" }, t("\\leftrightarrow "), { condition = in_mathzone }),
	s({ trig = "->", snippetType = "autosnippet" }, t("\\to"), { condition = in_mathzone }),
	s({ trig = "!>", snippetType = "autosnippet" }, t("\\mapsto"), { condition = in_mathzone }),
	s({ trig = "=>", snippetType = "autosnippet" }, t("\\implies"), { condition = in_mathzone }),
	s({ trig = "=<", snippetType = "autosnippet" }, t("\\impliedby"), { condition = in_mathzone }),
	s({ trig = "and", snippetType = "autosnippet" }, t("\\cap"), { condition = in_mathzone }),
	s({ trig = "orr", snippetType = "autosnippet" }, t("\\cup"), { condition = in_mathzone }),
	s({ trig = "inn", snippetType = "autosnippet" }, t("\\in"), { condition = in_mathzone }),
	s({ trig = "notin", snippetType = "autosnippet" }, t("\\not\\in"), { condition = in_mathzone }),
	s({ trig = "\\\\\\", snippetType = "autosnippet" }, t("\\setminus"), { condition = in_mathzone }),
	s({ trig = "sub=", snippetType = "autosnippet" }, t("\\subseteq"), { condition = in_mathzone }),
	s({ trig = "sup=", snippetType = "autosnippet" }, t("\\supseteq"), { condition = in_mathzone }),
	s({ trig = "eset", snippetType = "autosnippet" }, t("\\emptyset"), { condition = in_mathzone }),
	s({ trig = "set", snippetType = "autosnippet" }, fmta("\\{ <> \\}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "e\\xi sts", snippetType = "autosnippet" }, t("\\exists"), { condition = in_mathzone }),
	s({ trig = "LL", snippetType = "autosnippet" }, t("\\mathcal{L}"), { condition = in_mathzone }),
	s({ trig = "HH", snippetType = "autosnippet" }, t("\\mathcal{H}"), { condition = in_mathzone }),
	s({ trig = "CC", snippetType = "autosnippet" }, t("\\mathbb{C}"), { condition = in_mathzone }),
	s({ trig = "RR", snippetType = "autosnippet" }, t("\\mathbb{R}"), { condition = in_mathzone }),
	s({ trig = "ZZ", snippetType = "autosnippet" }, t("\\mathbb{Z}"), { condition = in_mathzone }),
	s({ trig = "NN", snippetType = "autosnippet" }, t("\\mathbb{N}"), { condition = in_mathzone }),

	-- Handle spaces and backslashes

	-- Snippet variables can be used as shortcuts when writing snippets.

	-- For example, ${GREEK} below is shorthand for "alpha|beta|gamma|Gamma|delta|..."

	-- -- You can edit snippet variables under the Advanced snippet settings section.
	-- s({trig="([^\\\\])(${GREEK})", snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before Greek letters"},
	-- s({trig="([^\\\\])(${SYMBOL})", snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before symbols"},

	-- -- Insert space after Greek letters and symbols
	-- s({trig="\\\\(${GREEK}|${SYMBOL}|${MORE_SYMBOLS})([A-Za-z])", snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) sr", snippetType="autosnippet"}, fmta("\\[[0]]^{2}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) cb", snippetType="autosnippet"}, fmta("\\[[0]]^{3}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) rd", snippetType="autosnippet"}, fmta("\\[[0]]^{$0}$1", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) hat", snippetType="autosnippet"}, fmta("\\hat{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) dot", snippetType="autosnippet"}, fmta("\\dot{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) bar", snippetType="autosnippet"}, fmta("\\bar{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) vec", snippetType="autosnippet"}, fmta("\\vec{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) tilde", snippetType="autosnippet"}, fmta("\\tilde{\\[[0]]}", { }), {condition=in_mathzone}),
	-- s({trig="\\\\(${GREEK}|${SYMBOL}) und", snippetType="autosnippet"}, fmta("\\underline{\\[[0]]}", { }), {condition=in_mathzone}),

	-- Derivatives and integrals
	s(
		{ trig = "par", snippetType = "autosnippet" },
		fmta("\\frac{ \\partial <> }{ \\partial <> }", { i(1, "y"), i(2, "x") }),
		{ condition = in_mathzone }
	),
	s({ trig = "pa%a%a", snippetType = "autosnippet" }, {
		f(function(_, snip)
			return "\\frac{ \\partial " .. snip.captures[1] .. "}{" .. snip.captures[2] .. "}"
		end),
	}, { condition = in_mathzone }),
	s({ trig = "ddt", snippetType = "autosnippet" }, t("\\frac{d}{dt} "), { condition = in_mathzone }),
	-- s({trig=/([^\\])int/, snippetType="autosnippet"}, fmta("[[0]]\\int", options: "mA", priority: -1},
	s(
		{ trig = "\\int", snippetType = "autosnippet" },
		fmta("\\int <> \\, d<>", { i(1), i(2, "x") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "dint", snippetType = "autosnippet" },
		fmta("\\int_{<>}^{<>} <> \\, d<>", { i(1, "0"), i(2, "1"), i(3), i(4, "x") }),
		{ condition = in_mathzone }
	),
	s({ trig = "oint", snippetType = "autosnippet" }, t("\\oint"), { condition = in_mathzone }),
	s({ trig = "iint", snippetType = "autosnippet" }, t("\\iint"), { condition = in_mathzone }),
	s({ trig = "iiint", snippetType = "autosnippet" }, t("\\iiint"), { condition = in_mathzone }),
	s(
		{ trig = "oinf", snippetType = "autosnippet" },
		fmta("\\int_{0}^{\\infty} <> \\, d<>", { i(1), i(2, "x") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "infi", snippetType = "autosnippet" },
		fmta("\\int_{-\\infty}^{\\infty} <> \\, d<>", { i(1), i(2, "x") }),
		{ condition = in_mathzone }
	),

	-- -- Trigonometry
	s(
		{ trig = "([^\\])(arcsin)", regTrig = true, snippetType = "autosnippet" },
		f(function(_, snip)
			return snip.captures[1] .. "\\" .. snip.captures[2]
		end)
	),
	-- s({trig=/([^\\])(arcsin|sin|arccos|cos|arctan|tan|csc|sec|cot)/, snippetType="autosnippet"}, fmta("[[0]]\\[[1]]", options: "rmA", description: "Add backslash before trig funcs"},
	-- s({trig=/\\(arcsin|sin|arccos|cos|arctan|tan|csc|sec|cot)([A-Za-gi-z])/,
	-- snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", options: "rmA",
	-- description: "Add space after trig funcs. Skips letter h to allow sinh, cosh, etc."},
	-- s({trig=/\\(sinh|cosh|tanh|coth)([A-Za-z])/,
	-- snippetType="autosnippet"}, fmta("\\[[0]] [[1]]", options: "rmA",
	-- description: "Add space after hyperbolic trig funcs"},

	-- -- Visual operations
	-- found no usecase
	-- s({trig="U", snippetType="autosnippet"}, fmta("\\underbrace{ ${VISUAL} }_{ $0 }", { }), {condition=in_mathzone}),
	-- s({trig="O", snippetType="autosnippet"}, fmta("\\overbrace{ ${VISUAL} }^{ $0 }", { }), {condition=in_mathzone}),
	-- s({trig="B", snippetType="autosnippet"}, fmta("\\underset{ $0 }{ ${VISUAL} }", { }), {condition=in_mathzone}),
	-- s({trig="C", snippetType="autosnippet"}, fmta("\\cancel{ ${VISUAL} }", { }), {condition=in_mathzone}),
	-- s({trig="K", snippetType="autosnippet"}, fmta("\\cancelto{ $0 }{ ${VISUAL} }", { }), {condition=in_mathzone}),
	-- s({trig="S", snippetType="autosnippet"}, fmta("\\sqrt{ ${VISUAL} }", { }), {condition=in_mathzone}),

	-- Physics
	s({ trig = "kbt", snippetType = "autosnippet" }, t("k_{B}T"), { condition = in_mathzone }),
	s({ trig = "msun", snippetType = "autosnippet" }, t("M_{\\odot}"), { condition = in_mathzone }),

	-- -- Quantum mechanics
	s({ trig = "dag", snippetType = "autosnippet" }, t("^{\\dagger}"), { condition = in_mathzone }),
	s({ trig = "o+", snippetType = "autosnippet" }, t("\\oplus "), { condition = in_mathzone }),
	s({ trig = "ox", snippetType = "autosnippet" }, t("\\otimes "), { condition = in_mathzone }),
	s({ trig = "bra", snippetType = "autosnippet" }, fmta("\\bra{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "ket", snippetType = "autosnippet" }, fmta("\\ket{<>}", { i(1) }), { condition = in_mathzone }),
	s(
		{ trig = "brk", snippetType = "autosnippet" },
		fmta("\\braket{ <> | <> }", { i(1), i(2) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "outer", snippetType = "autosnippet" },
		fmta("\\ket{<>} \\bra{<>}", { i(1, "\\psi"), rep(1) }),
		{ condition = in_mathzone }
	),

	-- -- Chemistry
	s({ trig = "pu", snippetType = "autosnippet" }, fmta("\\pu{ <> }", { i(1) }), { condition = in_mathzone }),
	s({ trig = "cee", snippetType = "autosnippet" }, fmta("\\ce{ <> }", { i(1) }), { condition = in_mathzone }),
	s({ trig = "he4", snippetType = "autosnippet" }, t("{}^{4}_{2}He "), { condition = in_mathzone }),
	s({ trig = "he3", snippetType = "autosnippet" }, t("{}^{3}_{2}He "), { condition = in_mathzone }),
	s(
		{ trig = "iso", snippetType = "autosnippet" },
		fmta("{}^{<>}_{<>}<>", { i(1, "4"), i(2, "2"), i(3, "He") }),
		{ condition = in_mathzone }
	),

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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
	),

	-- This should be triggered when in inline math mode
	-- s({trig="pmat", snippetType="autosnippet"}, fmta([[\begin{pmatrix}<>\end{pmatrix}]], {i(1)}), {condition=in_mathzone}),
	-- s({trig="bmat", snippetType="autosnippet"}, fmta([[\begin{bmatrix}<>\end{bmatrix}]], {i(1)}), {condition=in_mathzone}),
	-- s({trig="Bmat", snippetType="autosnippet"}, fmta( [[\begin{Bmatrix}<>\end{Bmatrix}]], {i(1)}), {condition=in_mathzone}),
	-- s({trig="vmat", snippetType="autosnippet"}, fmta( [[\begin{vmatrix}<>\end{vmatrix}]], {i(1)}), {condition=in_mathzone}),
	-- s({trig="Vmat", snippetType="autosnippet"}, fmta( [[\begin{Vmatrix}<>\end{Vmatrix}]], {i(1)}), {condition=in_mathzone}),
	-- s({trig="matrix", snippetType="autosnippet"}, fmta([[\begin{matrix}<>\end{matrix}]], {i(1)}), {condition=in_mathzone}),

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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
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
		{ condition = in_mathzone }
	),

	-- Brackets
	s(
		{ trig = "avg", snippetType = "autosnippet" },
		fmta("\\langle <> \\rangle", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "norm", snippetType = "autosnippet" },
		fmta("\\lvert <> \\rvert", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Norm", snippetType = "autosnippet" },
		fmta("\\lVert <> \\rVert", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "ceil", snippetType = "autosnippet" },
		fmta("\\lceil <> \\rceil", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "floor", snippetType = "autosnippet" },
		fmta("\\lfloor <> \\rfloor", { i(1) }),
		{ condition = in_mathzone }
	),
	s({ trig = "mod", snippetType = "autosnippet" }, fmta("|<>|", { i(1) }), { condition = in_mathzone }),
	-- s({trig="(", snippetType="autosnippet"}, fmta("(${VISUAL})", {i(1)}), {condition=in_mathzone}),
	-- s({trig="[", snippetType="autosnippet"}, fmta("[${VISUAL}]", {i(1)}), {condition=in_mathzone}),
	-- s({trig="{", snippetType="autosnippet"}, fmta("{${VISUAL}}", {i(1)}), {condition=in_mathzone}),
	s({ trig = "(", snippetType = "autosnippet" }, fmta("(<>)", { i(1) }), { condition = in_mathzone }),
	s({ trig = "{", snippetType = "autosnippet" }, fmta("{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "[", snippetType = "autosnippet" }, fmta("[<>]", { i(1) }), { condition = in_mathzone }),
	s(
		{ trig = "lr(", snippetType = "autosnippet" },
		fmta("\\left( <> \\right)", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr{", snippetType = "autosnippet" },
		fmta("\\left\\{ <> \\right\\}", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr[", snippetType = "autosnippet" },
		fmta("\\left[ <> \\right]", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr|", snippetType = "autosnippet" },
		fmta("\\left| <> \\right|", { i(1) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lra", snippetType = "autosnippet" },
		fmta("\\left<< <> \\right>>", { i(1) }),
		{ condition = in_mathzone }
	),
}
