return { -- TODO do it properly
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end
        },
      },
      {
        "saadparwaiz1/cmp_luasnip",
        config = function()
          require("luasnip.config").setup {}
        end
      },
    },
    opts = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      return {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        --[[ region_check_events = 'InsertEnter',
        delete_check_events = 'InsertLeave', ]]
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {}, -- I can't even use it, lol
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<C-d>'] = cmp.mapping(function()
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            end
          end, { 'i', 's' }),
          ['<C-u>'] = cmp.mapping(function()
            cmp.scroll_docs(-4)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
          ['<C-x>'] = cmp.mapping(function()
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            end
          end, { 'i', 's' }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
              cmp.select_next_item()
              --[[ elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() ]]
            elseif col ~= 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
              --[[ elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) ]]
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        },
      }
    end,
  },
}
