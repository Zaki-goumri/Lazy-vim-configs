-- Quick toggle for diagnostics
vim.keymap.set("n", "<leader>td", function()
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { desc = "Toggle Diagnostics" })

-- Manual LSP restart if needed
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })

-- Debug completion
vim.keymap.set("n", "<leader>cd", function()
  print("Checking completion setup...")

  -- Check if blink.cmp is loaded
  local blink_ok, blink = pcall(require, "blink.cmp")
  if blink_ok then
    print("✓ blink.cmp is loaded")
    print("Trying to show completion...")
    blink.show()
  else
    print("✗ blink.cmp not loaded:", blink)
  end

  -- Check if nvim-cmp is loaded
  local cmp_ok, cmp = pcall(require, "cmp")
  if cmp_ok then
    print("✓ nvim-cmp is loaded")
  else
    print("✗ nvim-cmp not loaded")
  end

  -- Check LSP clients
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients > 0 then
    print("✓ Active LSP clients:")
    for _, client in ipairs(clients) do
      print("  -", client.name)
    end
  else
    print("✗ No active LSP clients")
  end
end, { desc = "Debug Completion" })

-- Manual completion trigger
vim.keymap.set("i", "<C-Space>", function()
  local blink_ok, blink = pcall(require, "blink.cmp")
  if blink_ok then
    blink.show()
  else
    -- Fallback to built-in completion
    return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true), "n", false)
  end
end, { desc = "Manual Completion" })
