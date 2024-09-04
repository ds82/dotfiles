-- local rt = require("rust-tools")

vim.keymap.set("n", "gK", function()
	vim.cmd.RustLsp("openDocs")
end)

-- vim.keymap.set("n", "<leader>K", rt.hover_actions.hover_actions, { buffer = 0 })

-- vim.keymap.set({ "n", "v" }, "<C-;>", rt.code_action_group.code_action_group, { buffer = 0 })

-- vim.keymap.set(
-- 	{ "n", "v" },
-- 	"<leader><leader>D",
-- 	rt.debuggables.debuggables,
-- 	{ buffer = 0, desc = "Start Rust debugging" }
-- )

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4
