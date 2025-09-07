-- Disable vim messages that create popups
vim.opt.shortmess:append("c") -- Don't show completion messages
vim.opt.shortmess:append("S") -- Don't show search count
vim.opt.cmdheight = 0 -- Hide command line when not in use

-- Override vim.notify to do nothing
vim.notify = function() end

-- Disable LSP progress handler
vim.lsp.handlers["$/progress"] = function() end

-- Disable LSP message handler
vim.lsp.handlers["window/showMessage"] = function() end

-- Disable LSP log messages
vim.lsp.set_log_level("off")
