return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = function()
		local neogit = require("neogit")

		vim.api.nvim_create_user_command("NeogitLog", function()
			neogit.action("log", "log_current", {})()
		end, {})

		local keymap = vim.keymap
		keymap.set("n", "<leader><leader>g", function()
			neogit.open({ kind = "replace" })
		end, { desc = "Open Neogit Status", silent = true }) -- mapping to restart lsp if necessary

		keymap.set("n", "<leader><leader>l", function()
			neogit.action("log", "log_current", {})()
		end, { desc = "Open Git History", silent = true }) -- mapping to restart lsp if necessary

		keymap.set("n", "<leader><leader>w", function()
			vim.cmd(":silent !git add %")
		end, { desc = "Stage current file in git", silent = true }) -- mapping to restart lsp if necessary

		neogit.setup()
	end,
}
