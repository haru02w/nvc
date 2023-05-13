return {
	'mrjones2014/smart-splits.nvim',
	opts = {},
	config = function(opts)
		require('smart-splits').setup(opts)
		require('new.keymaps').smart_splits()
	end
}
