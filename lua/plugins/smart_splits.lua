return {
		'mrjones2014/smart-splits.nvim',
		config = function(_,opts)
			require('smart-splits').setup(opts)
			Smart_splits_keymaps()
		end
}
