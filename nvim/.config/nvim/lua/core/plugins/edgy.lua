return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		bottom = {
			{
				ft = "toggleterm",
				title = "ToggleTerm",
				size = { height = 0.4 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
	},
}
