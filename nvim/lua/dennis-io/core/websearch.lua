local gsearch = function(s)
	vim.ui.open("https://www.google.com/search?q=" .. s)
end

vim.keymap.set("n", "gX", function()
	local t = vim.fn.expand("<cword>")
	gsearch(t)
end, { desc = "Search for word under cursor in google" })

vim.keymap.set("v", "gX", function()
	vim.cmd('noau normal! "vy"')
	local t = vim.fn.getreg("v")
	gsearch(t)
end, { desc = "Search for visual selection in google" })
