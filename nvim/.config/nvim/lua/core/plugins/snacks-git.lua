return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	keys = {
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			mode = { "n" },
			desc = "Blame current line",
		},
	},
}
