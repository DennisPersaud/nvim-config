local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Set space to leader
vim.g.mapleader = " "

-- Remap ESC
map("i", "jk", "<ESC>", options)
map("i", "kj", "<ESC>", options)
map("i", "JK", "<ESC>", options)
map("i", "<C-c>", "<Esc>", options)
map("n", "<C-c>", "<Esc>", options)

-- J Fix
map("n", "J", "mzJ`z", options)

-- Page Jumping
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-u>", "<C-u>zz", options)

-- Tmux Session (Linux Only)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", options)

-- Substitute Word
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], options)

-- No Highlight
map("n", "//", ":noh<CR>", options)

-- Switch Buffers
map("n", "<C-l>", ":bn<CR>", options)
map("n", "<C-h>", ":bp<CR>", options)
-- Delete Buffer
map("n", "<C-b>d", ":bd<CR>", options)

-- Resize Split
-- map("n", "<C-w-i>i", ":resize-10<CR>", options)
-- map("n", "<Leader>k", ":resize+10<CR>", options)
-- map("n", "<C-w-[>", ":vertical resize+10<CR>", options)
-- map("n", "<C-w-]>", ":vertical resize-10<CR>", options)

-- Shift Lines
map("n", "<A-j>", ":m .+1<CR>==", options)
map("n", "<A-k>", ":m .-2<CR>==", options)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", options)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", options)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", options)

-- Disable Uppercase J
map("n", "<S-J>", "<Nop>", options)

-- Lazy.nvim
map("n", "<leader>l", ":Lazy<CR>", options)

------------------------------------------------------------
-- BUILD FILE
------------------------------------------------------------
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "c",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!gcc %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "cpp",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!g++ %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "python",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!python %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "cs",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!csc %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "java",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!javac %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "javascript",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!node %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "go",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!go build %<CR>", options)
			map("n", "<c-r>", ":!go run %<CR>", options)
		end)
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "rust",
	callback = function()
		vim.schedule(function()
			map("n", "<c-b>", ":!rustc %<CR>", options)
		end)
	end,
})
