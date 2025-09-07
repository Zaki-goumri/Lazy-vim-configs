return {
  -- Keep notifications disabled but restore completion
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },

  -- Restore default blink.cmp behavior (automatic completion)
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    -- Use mostly default settings to restore automatic behavior
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Keep all automatic behaviors enabled
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          auto_show = true, -- This is key - auto show on typing
          draw = "simple",
          border = "single",
        },
        documentation = {
          auto_show = true, -- Enable this for full functionality
          auto_show_delay_ms = 500,
          window = {
            border = "single",
          },
        },
        ghost_text = {
          enabled = true, -- Shows preview of completion
        },
      },
      signature = {
        enabled = true, -- Enable signature help
        window = {
          border = "single",
        },
      },
    },
  },

  -- Minimal LSP config - don't disable anything
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Only disable virtual text, keep everything else
      diagnostics = {
        virtual_text = false, -- Only this to avoid text covering code
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      },
      -- Only disable progress notifications, keep all other LSP features
      handlers = {
        ["$/progress"] = function() end,
      },
    },
  },
}
