return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	setup = function()
		local keymap = vim.keymap -- for conciseness
		local gs = require("gitsigns")

		keymap.set("n", "g]", function()
			gs.nav_hunk("next")
		end, {})
		keymap.set("n", "g[", function()
			gs.nav_hunk("prev")
		end, {})
	end,
}
