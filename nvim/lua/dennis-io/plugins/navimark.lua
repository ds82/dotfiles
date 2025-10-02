return {
	"zongben/navimark.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("navimark").setup({
			--set "" to disable keymapping
			keymap = {
				base = {
					mark_toggle = "<leader>mm",
					mark_add = "<leader>ma",
					mark_add_with_title = "<leader>mt",
					mark_remove = "<leader>mr",

					-- this only goes to the next/previous mark in the same file
					goto_next_mark = "]m",
					goto_prev_mark = "[m",
					open_mark_picker = "<leader>fm",
				},
				telescope = {
					n = {
						delete_mark = "d",
						clear_marks = "c",
						set_mark_title = "t",
						next_stack = "<Tab>",
						prev_stack = "<S-Tab>",
						new_stack = "N",
						rename_stack = "R",
						delete_stack = "D",
						-- open all marked files in current stack
						open_all_marked_files = "<C-o>",
					},
				},
			},
			sign = {
				text = "",
				color = "#FF0000",
				--options: above || eol || eol_right_align || right_align || none
				-- If set to 'none', you can still assign a title to a mark.
				-- The title will only appear in Telescope but will not be shown as virt_text in the editor.
				title_position = "above",
			},
			--set to true to persist stacks and marks
			persist = true,

			--options: manual || auto
			--auto: When the cwd changes, if a stack has the same root_dir as the cwd, that stack will be loaded automatically
			--manual: manage stacks manually
			stack_mode = "auto",
		})
	end,
}
