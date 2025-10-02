return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader><leader>F",
			function()
				require("diffview").emit("toggle_files")
			end,
			desc = "Toggle DiffviewToggleFiles",
		},
		-- {
		-- 	"<leader>h",
		-- 	function()
		-- 		vim.cmd("DiffviewFileHistory %")
		-- 	end,
		-- 	desc = "Open DiffviewFileHistory",
		-- },
	},
}
