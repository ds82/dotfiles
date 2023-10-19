return {
	"nvim-telescope/telescope.nvim",
	event = { "VimEnter" },
	cmd = "Telescope",
	module = "telescope",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"xiyaowong/telescope-emoji.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				ripgrep_arguments = {
					"rg",
					"--hidden",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--ignore-file",
					".gitignore",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("emoji")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>R", builtin.resume, {})

		keymap.set("v", "<leader>gf", function()
			vim.cmd('noau normal! "vy"')
			local visual_selection = vim.fn.getreg("v")
			builtin.find_files({ default_text = visual_selection })
		end, {})
		keymap.set("n", "<leader>t", builtin.find_files, {})
		keymap.set("n", "<leader>e", telescope.extensions.emoji.emoji, {})

		keymap.set("n", "<leader>o", builtin.oldfiles, {})
		keymap.set("n", "<leader>D", builtin.diagnostics, {})

		keymap.set("n", "<C-p>", builtin.git_files, {})
		keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		keymap.set("n", "<leader>b", builtin.buffers)
	end,
}
