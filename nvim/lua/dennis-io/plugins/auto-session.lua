return {
	"rmagatti/auto-session",
	opts = function()
		local auto_session = require("auto-session")

		local function close_nvim_tree()
			require("nvim-tree.api").tree.open()
		end
		local function open_nvim_tree()
			require("nvim-tree.api").tree.open()
		end

		auto_session.setup({
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "/", "~/Downloads", "~/Documents", "~/Desktop/" },
			log_level = "error",
			pre_save_cmds = { close_nvim_tree },
			post_save_cmds = { open_nvim_tree },
			post_open_cmds = { open_nvim_tree },
			post_restore_cmds = { open_nvim_tree },
			cwd_change_handling = {
				restore_upcoming_session = true,
				pre_cwd_changed_hook = close_nvim_tree,
				post_cwd_changed_hook = open_nvim_tree,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
