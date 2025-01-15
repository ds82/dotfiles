return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")

		vim.api.nvim_set_keymap(
			"i",
			"<C-j>",
			"<cmd>lua require'luasnip'.jump(1)<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"i",
			"<C-k>",
			"<cmd>lua require'luasnip'.jump(-1)<CR>",
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"s",
			"<C-j>",
			"<cmd>lua require'luasnip'.jump(1)<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"s",
			"<C-k>",
			"<cmd>lua require'luasnip'.jump(-1)<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
