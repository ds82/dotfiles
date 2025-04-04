return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		-- vim.keymap.set({ "i" }, "<C-L>", function()
		-- 	ls.expand()
		-- end, { silent = true })
		--
		-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
		-- 	ls.jump(1)
		-- end, { silent = true })
		--
		-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
		-- 	ls.jump(-1)
		-- end, { silent = true })
		--
		-- vim.keymap.set({ "i", "s" }, "<C-e>", function()
		-- 	if ls.choice_active() then
		-- 		ls.change_choice(1)
		-- 	end
		-- end, { silent = true })
	end,
}
