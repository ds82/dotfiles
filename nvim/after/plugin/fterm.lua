local fterm = require("FTerm")

fterm.setup({
	border     = 'single',
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

local tig = fterm:new({
	ft = 'fterm_tig', -- You can also override the default filetype, if you want
	cmd = "tig",
	dimensions = {
		height = 0.9,
		width = 0.9
	}
})

vim.keymap.set('n', '<F13>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<F13>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('t', '<S-F1>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('n', '<S-F1>', '<CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', '<F3>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<F3>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
