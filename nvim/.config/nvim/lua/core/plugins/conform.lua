return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Code Format",
		},
	},
	main = "conform",
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			cpp = { "ast-grep" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "isort", "black" },
			scss = { "prettier" },
			shell = { "shfmt" },
			svg = { "prettier" },
			tex = { "tex-fmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true }
			return {
				timeout_ms = 5000,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		notify_on_error = true,
	},
}
