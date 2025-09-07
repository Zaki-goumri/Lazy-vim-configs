-- Quick toggle for diagnostics
vim.keymap.set("n", "<leader>td", function()
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { desc = "Toggle Diagnostics" })

-- Manual LSP restart if needed
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })
