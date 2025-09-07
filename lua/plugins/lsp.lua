return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = opts.servers or {}

      -- Simplified Python configuration
      servers.pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- Turn off strict type checking
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      -- Simplified TypeScript configuration
      servers.tsserver = {}

      opts.servers = servers
      return opts
    end,
  },

  -- Minimal Mason setup
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "typescript-language-server", -- Use this instead of tsserver
        "prettier",
        "eslint_d",
      },
    },
  },
}
