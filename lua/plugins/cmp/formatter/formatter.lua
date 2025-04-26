return {
	{
		"mhartington/formatter.nvim",
		enabled = true,
		event = "VeryLazy",
		config = function()
			require("formatter").setup({
				logging = false,
				-- log_level = vim.log.levels.WARN,
				filetype = {
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
}
