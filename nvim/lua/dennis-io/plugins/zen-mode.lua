return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 1.0,
			},
			kitty = {
				enabled = false,
				font = "+4", -- font size increment
			},
		})

		vim.keymap.set("n", "<leader>z", function()
			require("zen-mode").toggle()
		end)
	end,
}
