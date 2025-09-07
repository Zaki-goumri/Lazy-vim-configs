-- Helper function to create augroups
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Simplified format on save (only for specific filetypes)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("format_on_save"),
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.py" },
  callback = function(args)
    -- Only format if conform is available and file is not too large
    local ok, conform = pcall(require, "conform")
    if ok and vim.api.nvim_buf_line_count(args.buf) < 1000 then
      conform.format({ bufnr = args.buf, timeout_ms = 1000 })
    end
  end,
})

-- Keep transparency settings
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("transparency"),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
  end,
})

-- Remove Python-specific autocmd that might cause issues
-- (commented out the complex Python setup)

-- Keep simple highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Keep simple auto-close for help windows
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = { "help", "lspinfo", "man", "qf", "query" },
  callback = function()
    vim.bo.buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
  end,
})
