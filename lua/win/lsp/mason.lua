-------------------------------------------------------------------------------------------
-- Mason
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.

-- local servers = {
-- 	clangd = {},
-- 	gopls = {},
-- 	-- pyright = {},
-- 	rust_analyzer = {},
-- 	ts_ls = {},
-- 
-- 	lua_ls = {
-- 		Lua = {
-- 			workspace = { checkThirdParty = false },
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- }

-- Setup mason so it can manage external tooling
require("mason").setup()
-- Setup mason-nvim-dap after mason
require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
})

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},

        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }
})
