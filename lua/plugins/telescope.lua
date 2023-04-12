return {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function(_,opts)
		require('telescope').setup(opts)
		Telescope_keymaps()
	end,
}
