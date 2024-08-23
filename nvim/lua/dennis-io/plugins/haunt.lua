return {
	"https://git.sr.ht/~adigitoleo/haunt.nvim",
	event = "VeryLazy",
	config = function()
		require("haunt").setup({
			define_commands = true,
			window = {
				width_frac = 0.9,
				height_frac = 0.9,
				winblend = 0,
				title_pos = "center",
			},
		})

		local keymap = vim.keymap -- for conciseness
		local haunt = require("haunt")

		keymap.set("n", "<F12>", function()
			haunt.term()
		end, {})
		keymap.set("t", "<F12>", function()
			haunt.reset()
		end, {})

		-- better usable on ipad
		keymap.set("n", "<F10>", function()
			haunt.term()
		end, {})
		keymap.set("t", "<F10>", function()
			haunt.reset()
		end, {})

		vim.api.nvim_create_user_command("H", function(opts)
			local file_dir = vim.fn.expand("%:h")
			local s = table.concat(opts.fargs, " ")
			require("telescope.builtin").grep_string({ cwd = file_dir, search = s })
		end, { nargs = 1 })

		-- vim.cmd.cnoremap("h", "HauntHelp ")
	end,
}
