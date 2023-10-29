local rt = require("rust-tools")

vim.keymap.set("n", "gK", ":RustOpenExternalDocs<CR>")
vim.keymap.set("n", "<leader>K", rt.hover_actions.hover_actions, { buffer = 0 })

vim.keymap.set({ "n", "v" }, "<C-k>", rt.code_action_group.code_action_group, { buffer = 0 })

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4
