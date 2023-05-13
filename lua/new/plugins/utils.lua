return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {},
  },
  {
    'j-morano/buffer_manager.nvim',
    opts = {},
    config = function(_, opts)
      require("buffer_manager").setup(opts)
      require("new.keymaps").buffer_manager()
    end
  },
  {
    'kevinhwang91/nvim-fFHighlight',
    opts = {
      number_hint_threshold = 2,
    }
  },
  {
    "mbbill/undotree",
    config = require("new.keymaps").undotree()
  },
  {
    'tpope/vim-fugitive',
    config = require("new.keymaps").fugitive()
  },
  'tpope/vim-rhubarb', -- TODO ??
  {
    -- Library for other plugins
    'nvim-lua/plenary.nvim',
    lazy = true
  }
}
