return {
	"NeogitOrg/neogit",
	branch = "master",
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

		vim.api.nvim_create_user_command("Gread", function()
			local file_uri = vim.fn.expand("%")
			local file_dir = vim.fn.expand("%:h")
			local exec_result = vim.system({ "git", "checkout", "--", file_uri }, { text = true }):wait()
			vim.cmd(":e!")
		end, {})

		neogit.setup()

		local keymap = vim.keymap
		-- keymap.set("n", "<leader><leader>g", function()
		-- 	neogit.open({ kind = "replace" })
		-- end, { desc = "Open Neogit Status", silent = true }) -- mapping to restart lsp if necessary

		-- save & add
		keymap.set("n", "<leader><leader>w", function()
			vim.cmd(":silent w!")

			local file_uri = vim.fn.expand("%:t")
			local file_dir = vim.fn.expand("%:p:h")
			local exec_result = vim.system({ "git", "add", file_uri }, { text = true, cwd = file_dir }):wait()
		end, { desc = "Save & stage current file" })

		-- status
		keymap.set("n", "<leader><leader>g", function()
			local file_dir = vim.fn.expand("%:h")
			local exec_result = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true, cwd = file_dir })
				:wait()
			local root = vim.fn.trim(exec_result.stdout)

			neogit.open({ kind = "replace", cwd = root })
		end, { desc = "Neogit status", silent = true })

		-- log
		keymap.set("n", "<leader><leader>l", function()
			neogit.action("log", "log_current", {})()
		end, { desc = "Open Git Log", silent = true }) -- mapping to restart lsp if necessary

		keymap.set("n", "<leader><leader>m", function()
			local file_dir = vim.fn.expand("%:h")
			print("file_dir: " .. file_dir)

			local exec_result = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true, cwd = file_dir })
				:wait()
			local root = vim.fn.trim(exec_result.stdout)

			neogit.open({ kind = "replace", cwd = root })
		end, { desc = "Neogit status", silent = true })

		keymap.set("n", "<leader><leader>lg", function()
			local file_uri = vim.fn.expand("%")
			neogit.action("log", "log_current", { file = file_uri })()
		end, { desc = "Open Git Log for current file", silent = true })
	end,
}
