return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<F13>]],
			direction = "float",
			float_opts = {
				border = "single",
			},
		})
	end,
}
