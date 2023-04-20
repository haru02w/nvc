---@diagnostic disable: need-check-nil
return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require 'alpha'
		local dashboard = require 'alpha.themes.dashboard'
		dashboard.section.header.val = {
			[[ _                       ___ ____           ]],
			[[| |__   __ _ _ __ _   _ / _ \___ \__      __]],
			[[| '_ \ / _` | '__| | | | | | |__) \ \ /\ / /]],
			[[| | | | (_| | |  | |_| | |_| / __/ \ V  V / ]],
			[[|_| |_|\__,_|_|   \__,_|\___/_____| \_/\_/  ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
			dashboard.button("p","  Projects",
				":lua require'telescope'.extensions.projects.projects()<CR>")
		}
		alpha.setup(dashboard.config)
	end
}
