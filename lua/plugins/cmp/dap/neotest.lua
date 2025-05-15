return {
	{
		"nvim-neotest/neotest",

		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-go",
			"olimorris/neotest-phpunit",
			"alfaix/neotest-gtest",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>" },
			{ "<leader>ti", "<cmd>Neotest output<cr>" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>" },
			{ "<leader>ta", "<cmd>lua require('neotest').run.run({suite = true })<cr>" }, -- Run Test Suite
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					-- require("neotest-gtest").setup({}),
					-- require("neotest-python"),
					-- require("neotest-plenary"),
					require("neotest-go"),
					require("neotest-vitest"),
					require("neotest-phpunit"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
}
