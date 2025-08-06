-- Helper function to create augroups
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("format_on_save"),
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- This will force transparency *after* any colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("transparency"),
  pattern = "*",
  callback = function()
    -- Set background transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  end,
})

-- Python-specific configuration
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("python_setup"),
  pattern = "python",
  callback = function()
    -- Add current project root to Python path
    local cwd = vim.fn.getcwd()
    vim.env.PYTHONPATH = cwd .. ":" .. (vim.env.PYTHONPATH or "")

    -- Try to find and use virtual environment
    local venv_paths = {
      cwd .. "/venv/bin/python",
      cwd .. "/.venv/bin/python",
      cwd .. "/env/bin/python",
      vim.fn.expand("~/venv/bin/python"),
    }

    for _, path in ipairs(venv_paths) do
      if vim.fn.executable(path) == 1 then
        vim.g.python3_host_prog = path
        break
      end
    end

    -- Configure buffer-local Python settings
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
  end,
})

-- Optional: Auto-save functionality
-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--   group = augroup("auto_save"),
--   pattern = "*",
--   callback = function()
--     -- Only auto-save if file exists and is not in certain directories
--     local bufname = vim.api.nvim_buf_get_name(0)
--     if bufname ~= "" and not bufname:match("^/tmp/") and not bufname:match("%.git/") then
--       vim.cmd("silent! write")
--     end
--   end,
-- })

-- Optional: Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Optional: Auto-close certain filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = { "help", "lspinfo", "man", "qf", "query" },
  callback = function()
    vim.bo.buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
  end,
})
