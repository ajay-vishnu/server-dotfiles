return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
		},
		config = function()
			vim.cmd([[colorscheme tokyonight-moon]])
			vim.cmd([[highlight DiagnosticUnnecessary guifg=NONE]])
		end,
	},
}
