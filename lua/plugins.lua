return {
  -- Load LazyVim core plugins first
  { import = "lazyvim.plugins" },

  -- Optionally include extras that are working for you
  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Your LSP tweaks
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = false,
      },
    },
  },

  -- Notification plugin
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade",
        timeout = 2000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
        background_colour = "#000000",
      })
      vim.notify = require("notify")
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
}
