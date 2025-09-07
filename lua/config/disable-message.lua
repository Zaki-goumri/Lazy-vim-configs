-- Only disable notification popups
vim.notify = function() end

-- Only disable LSP progress messages
vim.lsp.handlers["$/progress"] = function() end

-- IMPORTANT: Don't disable completion messages
-- vim.opt.shortmess:append("c") -- REMOVE THIS LINE
vim.opt.cmdheight = 1
