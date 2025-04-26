return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason.nvim" },
		"rshkarin/mason-nvim-lint",
		enabled = true,
		event = "VeryLazy",
		--event = {
		--	BufReadPre,
		--	BufNewFile,
		--},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "selene" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint" },
				yaml = { "yamllint" },
				-- php = { "php" },
				html = { "htmlhint" },
				-- json = { "jsonhint" },
				-- cpp = { "cppcheck", "cpplint" },
				-- ansible = { "ansible-lint" },
				bash = { "shellcheck" },
				-- Use the "*" filetype to run linters on all filetypes.
				-- ["*"] = { "global linter" },
				-- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
				-- ["_"] = { "fallback linter" },
				-- ["*"] = { "typos" },
			}

			-- local lint_augroup = vim.api.nvim_create_augroup("Lint", { clear = true })

			--vim.api.nvim_create_autocmd({ "BufEnter",
			--	"BufWritePost",
			--	"InsertLeave",
			--}, {
			--	group = lint_augroup,
			--	callback = function()
			--		lint.try_lint()
			--	end,
			--})

			-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			-- 	group = lint_augroup,
			-- 	callback = function()
			-- 		lint.try_lint()
			-- 	end,
			-- })

			--vim.keymap.set("n", "<leader-z>", function()
			--	lint.try_lint()
			--end, { desc = "Trigger linting for current file" })

			require("mason-nvim-lint").setup({
				ensure_installed = {
					"buf",
					"cmakelint",
					"cpplint",
					"eslint_d",
					"htmlhint",
					"jsonlint",
					"kulala-fmt",
					"mypy",
					"npm-groovy-lint",
					"pydocstyle",
					"pylint",
					"shellcheck",
					"yamllint",
				},
			})
		end,
	},
}
