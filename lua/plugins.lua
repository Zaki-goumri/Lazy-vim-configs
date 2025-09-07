return {
  -- Load LazyVim core plugins first
  { import = "lazyvim.plugins" },

  -- Disable notifications and popups
  {
    "rcarriga/nvim-notify",
    enabled = false, -- Completely disable notifications
  },
  {
    "folke/noice.nvim",
    enabled = false, -- Disable noice (fancy notifications)
  },
  {
    "goolord/alpha-nvim",
    enabled = false, -- Keep dashboard disabled
  },

  -- Simple LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable LSP progress notifications
      diagnostics = {
        virtual_text = false, -- Remove inline error text
        signs = true,
        underline = true,
        update_in_insert = false,
      },
      servers = {
        tsserver = {},
        pyright = {},
        html = {},
        cssls = {},
      },
    },
  },
}
