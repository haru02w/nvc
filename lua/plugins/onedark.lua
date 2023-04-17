return { -- colorscheme
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 999,
		config = function()
			require("onedark").setup {
				style = "deep",
				highlights = {
					Search = {bg = '#8B8000'}
				},
			}
			require("onedark").load()
		end,
}
