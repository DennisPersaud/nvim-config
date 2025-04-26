return {
	{
		"stevearc/conform.nvim",
		-- dependencies = { "mason.nvim" },
		enabled = true,
		event = "VeryLazy",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>fF",
				function()
					require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		--config = function()
		--	require("mason-conform").setup()
		--end,
		opts = function()
			---@type conform.setupOpts
			local opts = {
				default_format_opts = {
					timeout_ms = 3000,
					async = false, -- not recommended to change
					quiet = false, -- not recommended to change
					lsp_format = "fallback", -- not recommended to change
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "autopep8", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					sh = { "shfmt" },
					cpp = { "clang-format" },
					c = { "clang-format" },
					json = { "jq" },
					html = { "kulala-fmt" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				-- The options you set here will be merged with the builtin formatters.
				-- You can also define any custom formatters here.
				---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
				formatters = {
					injected = { options = { ignore_errors = true } },
					-- # Example of using dprint only when a dprint.json file is present
					-- dprint = {
					--   condition = function(ctx)
					--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
					--   end,
					-- },
					--
					-- # Example of using shfmt with extra args
					-- shfmt = {
					--   prepend_args = { "-i", "2", "-ci" },
					-- },
				},
			}
			return opts
		end,
	},
	{
		-- Integrate Maosn with conform
		"zapling/mason-conform.nvim",
		dependencies = { "stevearc/conform.nvim" },
		config = function()
			require("mason-conform").setup()
		end,
	},
}
