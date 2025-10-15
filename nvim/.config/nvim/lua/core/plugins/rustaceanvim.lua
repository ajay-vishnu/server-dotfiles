return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
			{
				lazy = true,
				"lvimuser/lsp-inlayhints.nvim",
				cond = vim.version().minor < 10,
				opts = {},
			},
		},
		lazy = false,
		ft = { "rust" },
		config = function()
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						if vim.version.minor >= 10 then
							local success, _ = pcall(vim.lsp.inlay_hint.enable, true)
							if not success then
								vim.lsp.inlay_hint.enable(true, { 0 })
							end
						end
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {},
					},
				},
				-- DAP configuration
				dap = {},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		ft = "toml",
		lazy = true,
	},
}
