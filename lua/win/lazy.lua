-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins.cmp" },
		{ import = "plugins.cmp.lsp" },
		{ import = "plugins.cmp.linter" },
		{ import = "plugins.cmp.formatter" },
		{ import = "plugins.cmp.dap" },
		{ import = "plugins.ai" },
		{ import = "plugins.ui" },

		-- Magma Jupyter Notebook Client
		-- { "dccsillag/magma-nvim", build = ":UpdateRemotePlugins" },

		-- -- Miscellaneous
		-- "mbbill/undotree",
		-- "lewis6991/gitsigns.nvim",
		-- "udalov/kotlin-vim",

		-- -- Theme
		{ "ajmwagar/vim-deus" },
		{
			"sainnhe/sonokai",
			priority = 1000,
			config = function()
				vim.g.sonokai_transparent_background = "1"
				vim.g.sonokai_enable_italic = "1"
				vim.g.sonokai_style = "andromeda"
				-- vim.cmd.colorscheme("sonokai")
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- -- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "deus" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
