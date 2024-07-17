vim.o.wrap = false
vim.o.linebreak = false

vim.bo.tabstop = 2 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 2 -- size of an indentation (sw).

vim.keymap.set("n", "<leader>6", function()
	vim.cmd("ClangdSwitchSourceHeader")
end)

vim.keymap.set("n", "<leader><leader>6", function()
	local filename_wo_extension = vim.fn.expand("%:t:r")
	local builtin = require("telescope.builtin")

	builtin.find_files({ default_text = filename_wo_extension })
end)
