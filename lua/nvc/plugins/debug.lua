return { -- TODO search how to configure it properly
	--[[ {
		"mfussenegger/nvim-dap",
		lazy = true,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "stylua", "jq" },
				handlers = {}, -- sets up dap in the predefined manner
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"},
		opts = {},
		config = function (_,opts)
			require("dapui").setup(opts)
			require("nvc.keymaps").dap()
		end
	}, ]]
}
