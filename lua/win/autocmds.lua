-- Ensure TreeSitter highlighting is enabled
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*", -- Apply to all files/buffers
	command = "TSEnable highlight",
	desc = "Enable Tree-sitter highlighting on startup", --Optional description
})
