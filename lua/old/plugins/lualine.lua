return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		lazy = true
	},
	config = function()
		local function clock()
			return "󰅐 ".. os.date("%H:%M:%S")
		end
		require('lualine').setup {
			sections = {
				lualine_c = {
					{ 'filename', path = 4 },
				},
				lualine_y = {
					{ clock, color = { fg = '#d78700' } }
				}
			},
		}
	end,
}
