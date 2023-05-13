return {
  -- Detect tabstop and shiftwidth automatically
  {
    "nmac427/guess-indent.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = {},
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    -- TODO put keybinds to it
    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function(_, opts)
      require('Comment').setup(opts)
      require("new.keymaps").comment()
    end
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
}
