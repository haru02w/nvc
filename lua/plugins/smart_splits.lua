return {
	'mrjones2014/smart-splits.nvim',
	opts = {},
	config = function(opts)
		require('smart-splits').setup(opts)
		Smart_splits_keymaps()
	end
}
