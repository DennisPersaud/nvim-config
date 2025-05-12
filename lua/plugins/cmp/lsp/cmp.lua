return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = true,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- Lspkind
			"onsails/lspkind.nvim",
			-- Luasnip
			{
				"L3MON4D3/LuaSnip",
				-- Snippets
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			-- Snippets
			local luasnip = require("luasnip")
			luasnip.config.set_config({
				history = true, -- keep around last snippet local to jump back
				enabled_autosnippets = true,
			})
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.filetype_extend("javascript", { "javascriptreact" })
			luasnip.filetype_extend("javascript", { "html" })

			local lspkind = require("lspkind")

			-- require("luasnip.loaders.from_vscode").lazy_load()
			local cmp = require("cmp")
			cmp.setup({
				-- Add Pictograms to LSP Menu
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						maxwidth = {
							-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							-- can also be a function to dynamically calculate max width such as
							-- menu = function() return math.floor(0.45 * vim.o.columns) end,
							menu = 50, -- leading text (labelDetails)
							abbr = 50, -- actual suggestion item
						},
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							-- ...
							return vim_item
						end,
					}),
				},
				sources = cmp.config.sources({
					per_filetype = {},
					{ name = "lazydev" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = "vsnip" }, -- For vsnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
					{ name = "codecompanion" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
				--               sources = {
				--                   {name = 'nvim_lsp'},
				--               },
				window = {
					completion = {
						border = "rounded",
					},
					documentation = {
						border = "rounded",
					},
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					[":silent <C-n>"] = cmp.mapping.select_next_item(),
					[":silent <C-p>"] = cmp.mapping.select_prev_item(),
					[":silent <C-d>"] = cmp.mapping.scroll_docs(-4),
					[":silent <C-u>"] = cmp.mapping.scroll_docs(4),
					[":silent <C-Space>"] = cmp.mapping.complete(),
					[":silent <C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
						vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
			})
		end,
	},
}
