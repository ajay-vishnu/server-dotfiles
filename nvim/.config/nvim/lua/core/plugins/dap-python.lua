return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function(_, opts)
		require("dap-python").setup("python")

		vim.keymap.set("n", "<leader>dpr", function()
			require("dap-python").test_method()
		end)
	end,
}
