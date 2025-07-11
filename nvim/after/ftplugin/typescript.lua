-- tabs/spaces
vim.bo.tabstop = 2 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 2 -- size of an indentation (sw).
vim.bo.expandtab = true -- always uses spaces instead of tab characters (et).
vim.bo.softtabstop = 2 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

-- vim.opt.makeprg = "tsc --noEmit --pretty false"
-- vim.opt.errorformat = "%f(%l,%c): %m,%f:%l:%m"

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "typescript",
-- 	callback = function()
-- 		vim.opt_local.makeprg = "cd " .. vim.fn.expand("%:p:h") .. " && tsc --noEmit"
-- 		vim.opt_local.errorformat = "%f(%l,%c): %m,%f:%l:%m"
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("QuickFixCmdPost", {
-- 	pattern = "[^l]*",
-- 	command = "nested cwindow",
-- })

vim.opt.makeprg = "tsc -p %:h --noEmit --pretty false"
vim.opt.errorformat = "%f(%l,%c): %m,%f:%l:%m"
