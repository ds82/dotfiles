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
				file_ignore_patterns = {
					"%.git/", -- INFO: % is the escape character for lua regexp magic chars
					"node_modules",
				},
				ripgrep_arguments = {
					"rg",
					"--hidden",
					-- "--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--ignore-file",
					".gitignore",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-Q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-h>"] = "which_key",
					},
					n = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-Q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				emoji = {
					action = function(emoji)
						-- argument emoji is a table.
						-- {name="", value="", cagegory="", description=""}

						-- vim.fn.setreg("*", emoji.value)
						-- print([[Press p or "*p to paste this emoji]] .. emoji.value)

						-- insert emoji when picked
						vim.api.nvim_put({ emoji.value }, "", false, false)
					end,
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
		keymap.set("n", "<leader>gf", ":Telescope find_files default_text=<C-R><C-W><CR>", {})

		keymap.set("n", "<leader>t", builtin.find_files, {})
		keymap.set("n", "<leader>e", telescope.extensions.emoji.emoji, {})

		keymap.set("n", "<leader>o", builtin.oldfiles, {})
		keymap.set("n", "<leader>D", function()
			builtin.diagnostics({ sort_by = "severity" })
		end, {})
		keymap.set("n", "<leader>J", builtin.jumplist, {})

		keymap.set("n", "<C-p>", builtin.git_files, {})
		keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		keymap.set("n", "<leader>b", builtin.buffers)

		keymap.set("n", "<leader><leader>G", builtin.git_status)

		vim.keymap.set(
			"n",
			"<leader>rg",
			":Telescope grep_string search=<C-R><C-W><CR>",
			{ desc = "Search word under cursor in project" }
		)
		vim.keymap.set("v", "<leader>rg", function()
			vim.cmd('noau normal! "vy"')
			local text = vim.fn.getreg("v")
			vim.cmd(":Telescope grep_string search=" .. text)
		end, { desc = "Search visual selection in project" })

		vim.api.nvim_create_user_command("Rg", function(opts)
			local s = table.concat(opts.fargs, " ")
			require("telescope.builtin").grep_string({ search = s, use_regex = true })
		end, { nargs = 1 })

		vim.api.nvim_create_user_command("Rgd", function(opts)
			local file_dir = vim.fn.expand("%:h")
			local s = table.concat(opts.fargs, " ")
			require("telescope.builtin").grep_string({ cwd = file_dir, search = s })
		end, { nargs = 1 })
	end,
}
