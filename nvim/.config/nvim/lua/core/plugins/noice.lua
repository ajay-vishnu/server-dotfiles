return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	main = "noice",
	opts = {
		cmdline = {
			format = {
				man = { pattern = { "^:%s*Man%s+" }, icon = " " },
			},
		},
		popupmenu = {
			backend = "cmp",
		},
		lsp = {
			progress = {
				enabled = true,
			},
		},
		presets = {
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
		},
	},
}
