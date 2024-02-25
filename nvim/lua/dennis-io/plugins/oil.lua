return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader><leader>f", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
