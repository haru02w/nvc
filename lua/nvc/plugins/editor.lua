return {
	-- Detect tabstop and shiftwidth automatically
	{
		'nmac427/guess-indent.nvim',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
		opts = {},
	},
	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = '┊',
			show_trailing_blankline_indent = false,
		},
	},
	{
		-- TODO put keybinds to it
		-- "gc" to comment visual regions/lines
		'numToStr/Comment.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
		config = function(_, opts)
			require('Comment').setup(opts)
			require('nvc.keymaps').comment()
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {},
	},
	-- Config in tree-sitter
	{
		'windwp/nvim-ts-autotag',
		event = { 'BufReadPost', 'BufNewFile' },
	},
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
		keys = require('nvc.keymaps').todo_comments(),
	},
	{
		'stevearc/oil.nvim',
		keys = require('nvc.keymaps').oil(),
		opts = {
			keymaps = {
				['<Esc>'] = 'actions.close',
				['q'] = 'actions.close',
			},
		},
		-- Optional dependencies
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		-- TODO configure it properly
		'lewis6991/gitsigns.nvim',
		opts = {},
	},
}
