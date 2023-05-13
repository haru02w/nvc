return {
  {
    -- Default UI ================
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = "deep",
      highlights = {
        Search = { bg = '#8B8000' }
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true
    },
    config = function()
      local function clock()
        return "󰅐 " .. os.date("%H:%M:%S")
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
  }, -- Default UI ================
  {
    'vimpostor/vim-tpipeline',
    lazy = false,
    config = function()
      vim.g.tpipeline_focuslost = 0
      vim.g.tpipeline_restore = 1
    end
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
