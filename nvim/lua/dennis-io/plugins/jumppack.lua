return {
	"suliatis/Jumppack.nvim",
	enabled = false,
	opts = {
		options = {
			global_mappings = true, -- Override <C-o>/<C-i> with Jumppack
			cwd_only = false, -- Show all jumps or only in current directory
			wrap_edges = true, -- Wrap around when reaching jumplist edges
			count_timeout_ms = 1000, -- Timeout for count accumulation (like Vim's timeout)
		},
		mappings = {
			-- Navigation
			jump_back = "<C-o>",
			jump_forward = "<C-i>",
			jump_to_top = "g",
			jump_to_bottom = "G",

			-- Selection
			choose = "<CR>",
			choose_in_split = "<C-s>",
			choose_in_vsplit = "<C-v>",
			choose_in_tabpage = "<C-t>",

			-- Control
			stop = "<Esc>",
			toggle_preview = "p",

			-- Filtering (temporary filters)
			toggle_file_filter = "f",
			toggle_cwd_filter = "c",
			toggle_show_hidden = ".",
			reset_filters = "r",

			-- Hide management
			toggle_hidden = "x",
		},
	},
	config = function(_, opts)
		local jumppack = require("Jumppack")
		jumppack.setup(opts)
	end,
}
