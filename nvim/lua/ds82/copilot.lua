-- vim.g.copilot_no_tab_map = true
-- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
-- vim.keymap.set('i', '<C-l>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
-- vim.g.copilot_assume_mapped = true

return {
	panel = {
		enabled = false,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>"
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-l>",
			accept_word = false,
			accept_line = false,
			next = "<C-k>",
			prev = "<C-j>",
			dismiss = "<C-m>",
		},
	},

	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = 'node', -- Node.js version must be > 16.x
	server_opts_overrides = {},
}
