return {
  -- Disable all notification systems
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },

  -- Configure LSP to be less intrusive
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- No inline error text
        signs = true, -- Keep gutter signs
        underline = true, -- Keep underlines
        update_in_insert = false, -- Don't update while typing
        severity_sort = true,
        float = false, -- No floating diagnostic windows
      },
      -- Disable LSP progress messages
      handlers = {
        ["$/progress"] = function() end, -- Disable progress notifications
        ["window/showMessage"] = function() end, -- Disable LSP messages
      },
    },
  },

  -- Simplify completion popup
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "none",
          scrollbar = false,
          -- Make completion less intrusive
          auto_show = false, -- Only show when explicitly triggered
        },
        documentation = {
          auto_show = false, -- Don't auto-show documentation
        },
      },
    },
  },
}
