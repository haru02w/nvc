return { {
          -- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		{
			'williamboman/mason-lspconfig.nvim',
			opts = { ensure_installed = { "lua_ls" } },
			config = function(_, opts)
				require("mason-lspconfig").setup(opts)

				require("mason-lspconfig").setup_handlers { function(server_name)
					require('lspconfig')[server_name].setup {
						on_attach = Lsp_keymaps(),
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
						settings = {
							Lua = {
								diagnostics = { globals = { 'vim' } }
							}
						}
					}
				end }
			end,
		},

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim',       opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
} }
