-- Ensure TreeSitter highlighting is enabled
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*" }, -- Apply to all file types
	callback = function()
		-- Check if the 'highlight' module for Tree-sitter is available and enabled.
		-- This helps prevent errors if Tree-sitter is not set up or the module is missing.
		if pcall(require, "nvim-treesitter.highlight") then
			-- Execute the command to enable Tree-sitter highlighting for the current buffer.
			-- 'silent!' makes the command run without printing messages to the command line.
			vim.cmd("silent! TSEnable highlight")
		end
	end,
	desc = "Enable Tree-sitter highlighting for opened files",
})
