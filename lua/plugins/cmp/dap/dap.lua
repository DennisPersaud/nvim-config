return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"jayp0521/mason-nvim-dap.nvim",
			"mxsdev/nvim-dap-vscode-js",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			{
				"microsoft/vscode-js-debug",
				-- After install, build it and rename the dist directory to out
				build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
				version = "1.*",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dap-go").setup()
			dapui.setup()

			-- Auto open debugger
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

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
				dapui.toggle()
			end, { silent = true, desc = "Toggle DAPUI" })

			-- :h dap.txt search:breakpoint
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "🟥", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "⛔", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })

			-- Node JS Integration
			require("dap-vscode-js").setup({
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
				local pwaType = "pwa-" .. adapterType

				dap.adapters[pwaType] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}

				-- this allow us to handle launch.json configurations
				-- which specify type as "node" or "chrome" or "msedge"
				dap.adapters[adapterType] = function(cb, config)
					local nativeAdapter = dap.adapters[pwaType]

					config.type = pwaType

					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end
		end,
	},
}
