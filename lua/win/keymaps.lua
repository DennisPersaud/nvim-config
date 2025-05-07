local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local Snacks = require("snacks")
local LazyDocker = require("lazydocker")

-- Set space to leader
vim.g.mapleader = " "

-- Open Explorere
-- vim.keymap.set("n", "\\\\", ":Lexplore<CR>")
vim.keymap.set("n", "\\\\", function()
	Snacks.explorer()
end, { silent = true, desc = "Open Snacks Explorer" })

-- Open Snacks Terminal
vim.keymap.set("n", "<C-t>", function(cmd, opts)
	Snacks.terminal.open(cmd, opts)
end, { silent = true, desc = "Open Snacks Terminal" })

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

-- Diable Uppercase J
map("n", "<S-J>", "<Nop>", options)

-- Lazy Git
--map("n", "<C-g>", ":LazyGit<CR>", options)
vim.keymap.set("n", "<C-g>", function()
	Snacks.lazygit()
end, { silent = true, desc = "Toggle Snacks Lazy Git" })

-- Lazy Docker
vim.keymap.set({ "n", "t" }, "<A-d>", function()
	LazyDocker.toggle()
end, { silent = true, desc = "Lazy Docker" })

-- Snacks Dashboard
vim.keymap.set("n", "<C-s>", function()
	Snacks.dashboard()
end, { silent = true, desc = "Toggle Snacks Dashboard" })

-- Snacks Notification History
vim.keymap.set("n", "<C-n>h", function()
	Snacks.notifier.show_history()
end, { silent = true, desc = "Toggle Snacks Dashboard" })

-- DAP 14b2ffa6-efc5-4d98-b8f7-302c5a8a0e71
vim.keymap.set("n", "<F10>", function()
	require("dapui").toggle()
end, { silent = true, desc = "Toggle DAPUI" })

-- Lazy.nvim
map("n", "<leader>l", ":Lazy<CR>", options)

-- Telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true, desc = "Telescope live grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { silent = true, desc = "Telescope buffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { silent = true, desc = "Telescope help tags" })

-- BUILD FILE
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

-- Snacks.Picker
-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { silent = true, desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function()
	Snacks.picker.buffers()
end, { silent = true, desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { silent = true, desc = "Grep" })
vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { silent = true, desc = "Command History" })
vim.keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { silent = true, desc = "Notification History" })
vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { silent = true, desc = "File Explorer" })
-- find
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { silent = true, desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { silent = true, desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { silent = true, desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { silent = true, desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { silent = true, desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { silent = true, desc = "Recent" })
-- git
vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { silent = true, desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { silent = true, desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { silent = true, desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { silent = true, desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { silent = true, desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { silent = true, desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { silent = true, desc = "Git Log File" })
-- Grep
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { silent = true, desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { silent = true, desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { silent = true, desc = "Grep" })
-- vim.keymap.set("n", "<leader>sw", function() Snacks.picker.grep_word() end, { silent = true, desc = "Visual selection or word", mode = { "n", "x" } })
-- search
vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { silent = true, desc = "Registers" })
vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { silent = true, desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { silent = true, desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { silent = true, desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { silent = true, desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { silent = true, desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { silent = true, desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, { silent = true, desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { silent = true, desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { silent = true, desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.icons()
end, { silent = true, desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { silent = true, desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { silent = true, desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { silent = true, desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { silent = true, desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function()
	Snacks.picker.man()
end, { silent = true, desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function()
	Snacks.picker.lazy()
end, { silent = true, desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { silent = true, desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { silent = true, desc = "Resume" })
vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { silent = true, desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { silent = true, desc = "Colorschemes" })
-- LSP
vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { silent = true, desc = "Goto Declaration" })
-- vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, nowait = true, { silent = true, desc = "References" })
vim.keymap.set("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { silent = true, desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { silent = true, desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, { silent = true, desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { silent = true, desc = "LSP Workspace Symbols" })
