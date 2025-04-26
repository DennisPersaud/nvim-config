-- Hide undefined global vim warning
---@diagnostic disable: undefined-global
---@global vim

vim.cmd.colorscheme("deus")

---@param colors ColorScheme
on_colors = function(colors)
    colors.bg_statusline = colors.none
end,

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.g["deus_termcolors"] = 256

vim.opt.guicursor = ""

vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = "$HOME/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 60
--vim.opt.signcolumn = "yes"
--vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- :h shell-powershell
vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
vim.cmd(
	"let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'"
)
vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")

-- Netrw-Explore config
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

vim.g.netrw_localcopydircmd = "cp -r"
vim.cmd("hi! link netrwMarkFile Search")

-- Change default dianostic symbols
vim.diagnostic.config({
	virtual_text = true, -- floating text next to code is too noisy.
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "🚩",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.INFO] = "ℹ",
			[vim.diagnostic.severity.HINT] = "💡",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- vim.lsp.enable("ansible-language-server")
-- vim.lsp.enable("bash-language-server")
-- vim.lsp.enable("cmake-language-server")
-- vim.lsp.enable("dockerfile-language-server")
-- vim.lsp.enable("emmet-language-server")
-- vim.lsp.enable("eslint-lsp")
-- vim.lsp.enable("html-lsp")
-- vim.lsp.enable("htmx-lsp")
-- vim.lsp.enable("json-lsp")
-- vim.lsp.enable("lua-language-server")
-- vim.lsp.enable("nginx-language-server")
-- vim.lsp.enable("pyright")
-- vim.lsp.enable("python-lsp-server")
-- vim.lsp.enable("solidity-ls solidity")
-- vim.lsp.enable("sqlls")
-- vim.lsp.enable("sqls")
-- vim.lsp.enable("typescript-language-server")
-- vim.lsp.enable("yaml-language-server")
