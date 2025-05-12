return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"jayp0521/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			require("dap-go").setup()
			require("dapui").setup()

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)

			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)

			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)

			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)

			vim.keymap.set("n", "<Leader>dt", function()
				dap.toggle_breakpoint()
			end)

			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint()
			end)

			vim.keymap.set("n", "<Leader>dp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)

			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end)

			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end)

			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end)

			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end)

			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end)

			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end)

			-- DAP UI
			vim.keymap.set("n", "<F10>", function()
				require("dapui").toggle()
			end, { silent = true, desc = "Toggle DAPUI" })

			-- :h dap.txt search:breakpoint
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "🟥", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "⛔", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })
		end,
	},
}
