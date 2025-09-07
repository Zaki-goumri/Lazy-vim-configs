return {
  -- Disable notifications but keep completion working
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },

  -- Configure blink.cmp properly
  {
    "saghen/blink.cmp",
    opts = {
      keymap = { preset = "default" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      completion = {
        menu = {
          auto_show = true, -- Show automatically when typing
          border = "single",
          scrollbar = true,
        },
        documentation = {
          auto_show = false, -- Don't show documentation popup automatically
          auto_show_delay_ms = 1000,
        },
        ghost_text = {
          enabled = true, -- Show inline preview
        },
      },

      signature = {
        enabled = false, -- Disable to reduce popups
      },
    },
  },
}
