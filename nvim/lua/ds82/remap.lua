vim.g.mapleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- keeps register content on pasting in visual mode with leader-p
vim.keymap.set("x", "<leader>p", [["_dP]])

-- quickfix window
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.keymap.set("n", "<leader>1", function()
  vim.api.nvim_command(":so ~/.config/nvim/init.lua");
end)
vim.keymap.set("n", "<leader><leader>1", function()
  vim.api.nvim_command(":so ~/.config/nvim/init.lua");
  vim.cmd.PackerSync();
end)

vim.keymap.set("n", "vv", "<C-W>v")
vim.keymap.set("n", "ss", "<C-W>s")
-- TODO
-- vim.keymap.set("n", "Q", "<C-W>q")
vim.keymap.set("n", "Q", function()
  vim.api.nvim_win_close(0, 1)
end)


-- buffer navigation
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<CR>")


vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-l>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
vim.g.copilot_assume_mapped = true