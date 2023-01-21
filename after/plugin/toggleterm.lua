require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	direction = "float",
	close_on_exit = "true",
	float_opts = {
		border = "curved",
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- Toggle Terminal
-- vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
--
