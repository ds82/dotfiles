-- Plugin that toggles between all sorts of things depending on context, e.g. toggles the done/undone syntax in markdown files
return {
	"AndrewRadev/switch.vim",
	config = function()
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader><leader>s", "<Cmd>Switch<CR>", {})
		keymap.set("v", "<leader><leader>s", ":norm ,,s<CR>", {})
	end,
}
