-- search word under cursor with fzf
vim.keymap.set("n", "<leader>ag", ":Rg <C-R><C-W><CR>", { desc = "Search word under cursor in project" })
vim.keymap.set("v", "<leader>ag", function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.cmd(':Rg ' .. text)
end, { desc = "Search visual selection in project" })

-- local fzf = require('fzf-lua')

-- vim.api.nvim_create_user_command(
-- 	'Rgd',
-- 	function(opts)
-- 		-- vim.cmd(':Rg ' .. opts.args .. ' -- ' .. vim.fn.expand('%:p:h'))
-- 		fzf.live_grep({ cmd = "rg " .. opts.args })
-- 	end,
-- 	{ nargs = 1 });
