return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>T", function()
			vim.cmd("Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR")
			-- require("trouble").toggle("quickfix")
		end)
	end,
}
