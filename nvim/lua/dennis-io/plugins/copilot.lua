return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			filetypes = {
				javascript = true, -- allow specific filetype
				typescript = true, -- allow specific filetype
				typescriptreact = true,
				sh = true,
				rust = true,
				["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
			},
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
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
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})
	end,
}
