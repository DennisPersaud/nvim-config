return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"rshkarin/mason-nvim-lint",
		},
		config = function()
			-- import mason
			local mason = require("mason")
			mason.setup()

			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

            -- local lsp_capabilities = require('cmp-nvim-lsp').default_capabilities()
			mason_lspconfig.setup({
				ensure_installed = {
					"eslint",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"pyright",
				},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            -- capabilities = lsp_capabilities,
                        })
                    end,
                },
			})
		end,
	},
}
