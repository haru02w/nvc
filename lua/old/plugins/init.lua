return {
	{
		'vimpostor/vim-tpipeline',
		config = function()
			vim.g.tpipeline_focuslost = 0
			vim.g.tpipeline_restore = 1
		end
	},
}
