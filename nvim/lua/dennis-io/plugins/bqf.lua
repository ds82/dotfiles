return {
	"kevinhwang91/nvim-bqf",
	opts = {
		auto_enable = true,
		auto_resize_height = true,
		preview = {
			should_preview_cb = function(bufnr, qflist, idx, opts)
				return false
			end,
		},
	},
}
-- return {
-- 	"stevearc/quicker.nvim",
-- 	event = "FileType qf",
-- 	keys = {
-- 		{
-- 			">",
-- 			function()
-- 				require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
-- 			end,
-- 			desc = "Expand quickfix context",
-- 		},
-- 		{
-- 			"<",
-- 			function()
-- 				require("quicker").collapse()
-- 			end,
-- 			desc = "Collapse quickfix context",
-- 		},
-- 	},
-- 	---@module "quicker"
-- 	---@type quicker.SetupOptions
-- 	opts = {},
-- 	config = function(_, opts)
-- 		require("quicker").setup(opts)
-- 		vim.keymap.set("n", "<leader>q", function()
-- 			require("quicker").toggle()
-- 		end, {
-- 			desc = "Toggle quickfix",
-- 		})
-- 		vim.keymap.set("n", "<leader>l", function()
-- 			require("quicker").toggle({ loclist = true })
-- 		end, {
-- 			desc = "Toggle loclist",
-- 		})
-- 	end,
-- }
