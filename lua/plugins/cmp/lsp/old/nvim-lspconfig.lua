return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "saghen/blink.cmp" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
				pyright = {},
				eslint = {},
				emmet_language_server = {},
				emmet_ls = {},
				ansiblels = {},
				angularls = {},
				autotools_ls = {},
				awk_ls = {},
				bashls = {},
				cmake = {},
				csharp_ls = {},
				cssls = {},
				docker_compose_language_service = {},
				dockerls = {},
				groovyls = {},
				graphql = {},
				grammarly = {},
				htmx = {},
				jsonls = {},
				kotlin_language_server = {},
				nginx_language_server = {},
				snyk_ls = {},
				solidity = {},
				terraformls = {},
				sqlls = {},
				ts_ls = {},
				yamlls = {},
			},
		},
		config = function()
            -- note: diagnostics are not exclusive to lsp servers
            -- so these can be global keybindings
            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

            vim.api.nvim_create_autocmd('LspAttach', {
              desc = 'LSP actions',
              callback = function(event)
                local opts = {buffer = event.buf}

                -- these will be buffer-local keybindings
                -- because they only work if you have an active language server

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
              end
            })
		end,
	},
}
-- blink.cmp

        --	local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- local capabilities = require('cmp-nvim-lsp').default_capabilities()
        --require("lspconfig").lua_ls.setup({ capabilities = capabilities })
        --require("lspconfig").pyright.setup({ capabilities = capabilities })
        --require("lspconfig").eslint.setup({ capabilities = capabilities })
        --require("lspconfig").emmet_ls.setup({ capabilities = capabilities })
        --require("lspconfig").docker_compose_language_service.setup({ capabilities = capabilities })
        --require("lspconfig").dockerls.setup({ capabilities = capabilities })
        --require("lspconfig").cssls.setup({ capabilities = capabilities })
        --require("lspconfig").ansiblels.setup({ capabilities = capabilities })
        --require("lspconfig").jsonls.setup({ capabilities = capabilities })
        --require("lspconfig").terraformls.setup({ capabilities = capabilities })
        --require("lspconfig").sqlls.setup({ capabilities = capabilities })
        --require("lspconfig").yamlls.setup({ capabilities = capabilities })

		-- 		config = function(_, opts)
		-- 			local lspconfig = require("lspconfig")
		-- 			for server, config in pairs(opts.servers) do
		-- 				-- passing config.capabilities to blink.cmp merges with the capabilities in your
		-- 				-- `opts[server].capabilities, if you've defined it
		-- 				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		-- 				lspconfig[server].setup(config)
		-- 			end
		-- 		end,
		-- example calling setup directly for each LSP
		--		config = function()
		--			local capabilities = require("blink.cmp").get_lsp_capabilities()
		--			local lspconfig = require("lspconfig")
		--			lspconfig["lua_ls"].setup({ capabilities = capabilities })
		--		end,
