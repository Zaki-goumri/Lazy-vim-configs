return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps (custom prefix <leader>m)
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "DAP Continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "DAP Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "DAP Step Out" })

      vim.keymap.set("n", "<leader>mb", function()
        dap.toggle_breakpoint()
      end, { desc = "DAP Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>mB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>mr", function()
        dap.repl.open()
      end, { desc = "DAP REPL" })

      -- Node.js / TypeScript adapter (requires vscode-js-debug installed)
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.config/nvim/vscode-js-debug/out/src/debugServerMain.js" },
      }

      dap.configurations.typescript = {
        {
          type = "node2",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }

      dap.configurations.javascript = dap.configurations.typescript
    end,
  },
}
