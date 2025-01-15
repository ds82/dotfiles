return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader><leader>f", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
