--     Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
--     Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
--
-- See :help dap.txt, :help dap-mapping and :help dap-api.

local opts = { buffer = bufnr, remap = false }

vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<leader>si", ":lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<leader>so", ":lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<leader>ro", ":lua require'dap'.repl.open()<CR>", opts)

-- Dap UI
require("dapui").setup()
vim.keymap.set("n", "<leader>dt", "require(''dapui').toggle()<CR>", opts)
