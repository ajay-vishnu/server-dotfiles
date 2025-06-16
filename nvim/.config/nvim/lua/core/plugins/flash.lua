return {
	"folke/flash.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
	keys = {
		{
			"fj",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash search and jump",
		},
		{
			"ft",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash treesitter",
		},
		{
			"fr",
			mode = { "n", "x", "o" },
			function()
				require("flash").remote()
			end,
			desc = "Flash remote",
		},
		{
			"fs",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash treesitter search",
		},
	},
}
