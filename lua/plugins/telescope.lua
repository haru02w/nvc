return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function(_,opts)
		require('telescope').setup(opts)
		Telescope_keymaps()
	end,
}
