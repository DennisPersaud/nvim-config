return {
	{
		"crnvl96/lazydocker.nvim",
		lazy = false,
		config = function()
			require("lazydocker").setup({
				window = {
					settings = {
						width = 0.900, -- Percentage of screen width (0 to 1)
						height = 0.900, -- Percentage of screen height (0 to 1)
						border = "rounded", -- See ':h nvim_open_win' border options
						relative = "editor", -- See ':h nvim_open_win' relative options
					},
				},
			})
			-- Set keymap
			vim.keymap.set({ "n", "t" }, "<A-d>", function()
				LazyDocker.toggle()
			end, { silent = true, desc = "Lazy Docker" })
		end,
	},
}
