return {
	{
		"olimorris/codecompanion.nvim",
		enabled = true,
		opts = {},
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.keymap.set(
				{ "n", "v" },
				"<C-a>j",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true }
			)
			vim.keymap.set({ "n", "v" }, "<C-a>k", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])

			require("codecompanion").setup({
				strategies = {
					-- Change the default chat adapter
					chat = {
						adapter = "gemini",
						-- keymaps = {
						-- 	send = {
						-- 		modes = { n = "<C-s>", i = "<C-s>" },
						-- 	},
						-- 	close = {
						-- 		modes = { n = "<C-c>", i = "<C-c>" },
						-- 	},
						-- 	-- Add further custom keymaps here
						-- },
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
				},
				opts = {
					-- Set debug logging
					log_level = "DEBUG",
				},
				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								-- api_key = 'cmd: keepassxc-cli.exe show -s -a password "G:\\My Drive\\stuff\\dp4aso89dfa7-20250404_103934.kdbx" "GEMINI_API_KEY"',
								-- api_key = "cmd: keepassxc-cli.exe show -k E:\\kf.keyx --no-password -a password 'G:\\My Drive\\stuff\\dp6aso89dfa7-20250404_103934.kdbx' 'GEMINI_API_KEY'",
								api_key = os.getenv("GEMINI_API_KEY"),
							},
						})
					end,
					deepseek = function()
						return require("codecompanion.adapters").extend("deepseek", {
							env = {
								-- api_key = 'cmd:(keepassxc-cli.exe show -s -a password "G:\\My Drive\\stuff\\dp4aso89dfa7-20250404_103934.kdbx" "DEEPSEEK_API_KEY").ToString()',
								api_key = os.getenv("DEEPSEEK_API_KEY"),
							},
						})
					end,
					huggingface = function()
						return require("codecompanion.adapters").extend("huggingface", {
							env = {
								-- api_key = 'cmd:keepassxc-cli.exe show -s -a password "G:\\My Drive\\stuff\\dp4aso89dfa7-20250404_103934.kdbx" "DEEPSEEK_API_KEY"',
							},
						})
					end,
				},
			})
		end,
	},
}
