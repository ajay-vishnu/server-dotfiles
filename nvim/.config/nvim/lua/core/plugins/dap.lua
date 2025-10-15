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

			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.launch["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, silent = true, desc = " Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, silent = true, desc = " Continue" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { noremap = true, silent = true, desc = " Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, silent = true, desc = " Step Into" })
			vim.keymap.set("n", "<leader>dO", dap.step_out, { noremap = true, silent = true, desc = " Step Out" })
			vim.keymap.set("n", "<leader>dq", dap.terminate, { noremap = true, silent = true, desc = " Terminate" })
			vim.keymap.set("n", "<leader>du", dapui.toggle, { noremap = true, silent = true, desc = " Start debugging" })
			vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, { noremap = true, silent = true, desc = "Go to cursor" })
		end,
	},
}
