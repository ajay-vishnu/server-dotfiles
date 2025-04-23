return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	keys = {
		{
			"<leader>gbl",
			function()
				Snacks.git.blame_line()
			end,
			mode = { "n" },
			desc = "Blame current line",
		},
	},
}
