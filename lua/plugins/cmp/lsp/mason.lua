return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "b0o/schemastore.nvim" },
		},
		config = function()
			-- LSPCONFIG KEY BINDINGS
			-- note: diagnostics are not exclusive to lsp servers
			-- so these can be global keybindings
			vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					-- these will be buffer-local keybindings
					-- because they only work if you have an active language server

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})
			-- MASON SETUP
			require("mason").setup()
			require("mason-nvim-dap").setup({
				ensure_installed = { "stylua", "jq" },
				handlers = {}, -- sets up dap in the predefined manner
			})
			require("mason-lspconfig").setup({
				handlers = {
					-- AUTOMATIC SERVER CONFIGURATION
					function(server_name) -- default handler (optional)
						-- local lsp_capabilities = require("blink.cmp").get_lsp_capabilities() -- Blink.CMP
						local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities() -- CMP
						require("lspconfig")[server_name].setup({
							capabilities = lsp_capabilities, -- Activate CMP Capabilities
						})
					end,
				},
				automatic_enable = {
					"lua_ls",
					"clangd",
					"pyright",
					"eslint",
					"html",
					"tailwindcss",
					"emmet_language_server",
					"ansiblels",
					"autotools_ls",
					"awk_ls",
					"bashls",
					"cmake",
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"groovyls",
					"graphql",
					"htmx",
					"jsonls",
					"kotlin_language_server",
					"nginx_language_server",
					"solidity",
					"terraformls",
					"sqlls",
					"ts_ls",
					"yamlls",
					"tflint",
					"marksman",
				},
				automatic_installation = {
					"lua_ls",
					"clangd",
					"pyright",
					"eslint",
					"html",
					"tailwindcss",
					"emmet_language_server",
					"ansiblels",
					"autotools_ls",
					"awk_ls",
					"bashls",
					"cmake",
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"groovyls",
					"graphql",
					"htmx",
					"jsonls",
					"kotlin_language_server",
					"nginx_language_server",
					"solidity",
					"terraformls",
					"sqlls",
					"ts_ls",
					"yamlls",
					"tflint",
					"marksman",
				},
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"eslint",
					"html",
					"tailwindcss",
					"emmet_language_server",
					"ansiblels",
					"autotools_ls",
					"awk_ls",
					"bashls",
					"cmake",
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"groovyls",
					"graphql",
					"htmx",
					"jsonls",
					"kotlin_language_server",
					"nginx_language_server",
					"solidity",
					"terraformls",
					"sqlls",
					"ts_ls",
					"yamlls",
					"tflint",
					"marksman",
				},
			})
			-- CONFIGURE LSP SERVERS
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
							globals = { "vim", "require" },
							disable = { "undefined_global", "missing-parameters", "missing-fields" },
						},
					},
				},
			})
			vim.lsp.config("clangd", {
				settings = {
					fallbackFlags = { "--std=c++20" },
				},
			})
			vim.lsp.config("tailwindcss", {
				settings = {
					cmd = { "tailwindcss-language-server", "--stdio" },
					-- filetypes copied and adjusted from tailwindcss-intellisense
					filetypes = {
						-- html
						"aspnetcorerazor",
						"astro",
						"astro-markdown",
						"blade",
						"clojure",
						"django-html",
						"htmldjango",
						"edge",
						"eelixir", -- vim ft
						"elixir",
						"ejs",
						"erb",
						"eruby", -- vim ft
						"gohtml",
						"gohtmltmpl",
						"haml",
						"handlebars",
						"hbs",
						"html",
						"htmlangular",
						"html-eex",
						"heex",
						"jade",
						"leaf",
						"liquid",
						"markdown",
						"mdx",
						"mustache",
						"njk",
						"nunjucks",
						"php",
						"razor",
						"slim",
						"twig",
						-- css
						"css",
						"less",
						"postcss",
						"sass",
						"scss",
						"stylus",
						"sugarss",
						-- js
						"javascript",
						"javascriptreact",
						"reason",
						"rescript",
						"typescript",
						"typescriptreact",
						-- mixed
						"vue",
						"svelte",
						"templ",
					},
					settings = {
						tailwindCSS = {
							validate = true,
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidScreen = "error",
								invalidVariant = "error",
								invalidConfigPath = "error",
								invalidTailwindDirective = "error",
								recommendedVariantOrder = "warning",
							},
							classAttributes = {
								"class",
								"className",
								"class:list",
								"classList",
								"ngClass",
							},
							includeLanguages = {
								eelixir = "html-eex",
								eruby = "erb",
								templ = "html",
								htmlangular = "html",
							},
						},
					},
				},
			})
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})
		end,
	},
}
