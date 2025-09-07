return {
  -- Load LazyVim core plugins
  { import = "lazyvim.plugins" },

  -- Just disable the dashboard
  {
    "goolord/alpha-nvim",
    enabled = false,
  },

  -- Keep your LSP servers simple
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
        pyright = {},
        html = {},
        cssls = {},
      },
    },
  },
}
