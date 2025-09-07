-- Only disable notification popups, keep everything else working
vim.notify = function() end

-- Only disable LSP progress messages
vim.lsp.handlers["$/progress"] = function() end

-- Keep normal completion messages
vim.opt.shortmess:remove("c") -- Allow completion messages
vim.opt.cmdheight = 1 -- Show command line
