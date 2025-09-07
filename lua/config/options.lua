vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Make background transparent
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

-- Force the colorscheme after setting up transparency

vim.cmd.colorscheme("default") -- Or "habamax", "evening", "desert", etc.

-- Enable built-in completion as fallback
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10 -- Limit popup menu height

-- Enable omnifunc for LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})
