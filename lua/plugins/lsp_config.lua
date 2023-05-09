return { {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		{
			'williamboman/mason-lspconfig.nvim',
			opts = { ensure_installed = { "lua_ls" } },
			config = function(opts)
				require("mason-lspconfig").setup(opts)

				require("mason-lspconfig").setup_handlers {
					function(server_name)
						require('lspconfig')[server_name].setup {
							on_attach = Lsp_keymaps(),
							capabilities = require('cmp_nvim_lsp').default_capabilities(),
						}
					end,
					["lua_ls"] = function()
						require('lspconfig').lua_ls.setup {
							on_attach = Lsp_keymaps(),
							capabilities = require('cmp_nvim_lsp').default_capabilities(),
							settings = {
								Lua = {
									diagnostics = { globals = { 'vim' } }
								}
							}
						}
					end,
					["jdtls"] = function()
						require('lspconfig').jdtls.setup {
							on_attach = Lsp_keymaps(),
							capabilities = require('cmp_nvim_lsp').default_capabilities(),
							root_dir = require('lspconfig').util.root_pattern("pom.xml", "build.gradle", ".git") or
							vim.fn.getcwd()
						}
					end,
				}
			end,
		},

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim',       opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
} }
