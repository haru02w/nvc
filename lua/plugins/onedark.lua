return { -- colorscheme
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 999,
		config = function()
			require("onedark").setup {
				style = "deep",
			}
			require("onedark").load()
		end,
}
