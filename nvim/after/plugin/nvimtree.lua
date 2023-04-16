-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			}
		}
	}
})


vim.keymap.set("n", "<F2>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>F", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "|", "<cmd>NvimTreeFindFile<CR>")
