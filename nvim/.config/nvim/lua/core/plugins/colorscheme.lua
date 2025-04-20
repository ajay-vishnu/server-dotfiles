return {
	{
		"ptdewey/monalisa-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme monalisa]])
			vim.cmd([[highlight DiagnosticUnnecessary guifg=NONE]])
		end,
	},
}
