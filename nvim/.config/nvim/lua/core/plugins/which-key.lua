return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		require("which-key").add({
			{ "<leader><tab>", group = "tab", icon = "󰓩" },
			{ "<leader>b", group = "buffer", icon = "" },
			{ "<leader>c", group = "code", icon = "" },
			{ "<leader>d", group = "debugging", icon = "" },
			{ "<leader>e", group = "yazi", icon = { icon = "󰇥", color = "yellow" } },
			{ "<leader>f", group = "find/file", icon = "" },
			{ "<leader>g", group = "git", icon = { icon = "", color = "red" } },
			{ "<leader>l", group = "Lazy", icon = "" },
			{ "<leader>o", group = "options/toggle", icon = "" },
			{ "<leader>q", group = "sessions", icon = { icon = "", color = "red" } },
			{ "<leader>r", group = "reload", icon = "󰑓" },
			{ "<leader>s", group = "split", icon = "" },
			{ "<leader>t", group = "tab", icon = "󰓩" },
			{ "<leader>u", group = "undo/ui" },
			{ "<leader>v", group = "vimtex" },
			{ "<leader>x", group = "python-terminal", icon = "" },
			{ "<leader>?", group = "which-key", icon = "" },
			{ "<leader>\\", icon = { icon = "", color = "azure" } },
			{ "<localleader>l", group = "vimtex", icon = { icon = "", color = "green" } },
		})
	end,
}
