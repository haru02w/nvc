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
			require("which-key").setup()
		end,
	},
	{
		"mbbill/undotree",
		config = Undotree_keymaps(),
	},
	{
		"tpope/vim-fugitive",
		config = Fugitive_keymaps()
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent_blankline_char = '|',
			show_current_context = true,
			show_current_context_start = true,
		},
	},
	{
		"max397574/better-escape.nvim",
		opts = {
			clear_empty_lines = true,
			keys = function()
				return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
			end,
		}
	},
	{
		"moll/vim-bbye",
		config = Bbye_keymaps()
	},
}
