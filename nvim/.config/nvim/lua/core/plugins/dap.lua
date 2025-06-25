return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"mason-org/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("nvim-dap-virtual-text").setup({
				commented = true, -- Show virtual text alongside comment
			})

			vim.fn.sign_define("DapBreakPoint", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapBreakPointRejected", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "DiagnosticSignWarn",
				linehl = "",
				numhl = "DiagnosticSignWarn",
			})

			dapui.setup()
			-- Automatically open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
			vim.keymap.set("n", "<leader>dc", dap.continue, opts)
			vim.keymap.set("n", "<leader>do", dap.step_over, opts)
			vim.keymap.set("n", "<leader>di", dap.step_into, opts)
			vim.keymap.set("n", "<leader>dO", dap.step_out, opts)
			vim.keymap.set("n", "<leader>dq", dap.terminate, opts)
			vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, opts)
		end,
	},
}
