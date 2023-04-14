return {
	{
		"lewis6991/impatient.nvim",
		config = function() require("impatient") end,
		priority = 1000,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"mbbill/undotree",
		config = Undotree_keymaps(),
	},
	{
		"tpope/vim-fugitive",
		config = Fugitive_keymaps()
	}
}
