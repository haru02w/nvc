return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      opts = {},
      lazy = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      cmd = { "LspInstall", "LspUninstall" },
      config = function()
        local mason = require("mason-lspconfig")
        local servers = {
          -- clangd = {}, ...
          lua_ls = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        }

        mason.setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local on_attach = require("new.keymaps").lsp()
        mason.setup_handlers {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
            }
          end,
          ["jdtls"] = function()
            require('lspconfig').jdtls.setup {
              on_attach = on_attach,
              capabilities = capabilities,
              root_dir = require('lspconfig').util.root_pattern("pom.xml", "build.gradle", ".git") or
                  vim.fn.getcwd()
            }
          end,
        }
      end
    },

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require("fidget").setup({})`
    {
      "j-hui/fidget.nvim",
      lazy = true,
      opts = {},
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    {
      "folke/neodev.nvim",
      lazy = true,
      opts = {},
    },
  },
}
