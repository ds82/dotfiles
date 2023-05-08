-- search word under cursor with fzf
vim.keymap.set("n", "<leader>ag", ":Rg <C-R><C-W><CR>")
vim.keymap.set("v", "<leader>ag", function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.cmd(':Rg ' .. text)
end)
