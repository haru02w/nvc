return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	config = function(opts)
		require('telescope').setup(opts)
		Telescope_keymaps()
	end,
}
