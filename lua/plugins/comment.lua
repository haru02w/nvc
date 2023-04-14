return {
	"numToStr/Comment.nvim",
	opts = {
		mappings = false,
	},
	config = function (_,opts)
		require('Comment').setup(opts)
		Comment_keymaps()
	end
}
