return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { 'rafamadriz/friendly-snippets' },
	},
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				mapping = Cmp_keymaps(cmp),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				sources = cmp.config.sources {
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip",  priority = 750 },
					{ name = "buffer",   priority = 500 },
					{ name = "path",     priority = 250 },
				},

			})
		end,
	}
}
