return {
  -- Python LSP configuration (combined and fixed)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local util = require("lspconfig.util")
      local servers = opts.servers or {}

      -- Function to find Python executable
      local function get_python_path(workspace)
        local path = util.path
        -- Check for virtual environment
        if vim.env.VIRTUAL_ENV then
          return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
        end

        -- Check common venv locations
        local venv_paths = {
          path.join(workspace, "venv", "bin", "python"),
          path.join(workspace, ".venv", "bin", "python"),
          path.join(workspace, "env", "bin", "python"),
        }

        for _, venv_path in ipairs(venv_paths) do
          if vim.fn.executable(venv_path) == 1 then
            return venv_path
          end
        end

        -- Fallback to system python
        return vim.fn.exepath("python3") or vim.fn.exepath("python")
      end

      -- Configure pyright with both settings and python path detection
      servers.pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
            },
          },
        },
        before_init = function(_, config)
          config.settings.python.pythonPath = get_python_path(config.root_dir)
        end,
      }

      return opts
    end,
  },

  -- Mason configuration for Python tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "isort",
        "flake8",
        "mypy",
        "debugpy",
      },
    },
  },
}
