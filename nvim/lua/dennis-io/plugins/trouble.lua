return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>T", function()
			require("trouble").toggle("quickfix")
		end)
	end,
}
