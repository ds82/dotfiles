vim.g.mapleader = ","
vim.g.maplocalleader = ",,"

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
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- search/replace prefilled
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.cmd("[[:%s/" .. text .. "]]")
end, { desc = "Open visual selection with default application" })

vim.keymap.set("n", "<C-F>", "<C-^>")

vim.keymap.set("n", "vv", "<C-W>v")
vim.keymap.set("n", "ss", "<C-W>s")
-- TODO
--
--
--
-- vim.keymap.set("n", "Q", "<C-W>q")
vim.keymap.set("n", "Q", function()
	vim.api.nvim_win_close(0, 1)
end)

-- vim.keymap.set("n", "gbt", "'<Cmd>GitBlameToggle<CR>", { desc = "Toggle Git Blame annotations" });

-- rebind ctrl-o, ctrl-o
-- vim.keymap.set("n", "<C-9>", "<C-o>zz")
-- vim.keymap.set("n", "<C-0>", "<C-i>zz")

-- buffer navigation
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- open selection/word
vim.keymap.set("n", "<leader>O", "!open <C-R><C-W><CR>", { desc = "Open word under cursor with default application" })
vim.keymap.set("v", "<leader>O", function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.cmd("!open " .. text)
end, { desc = "Open visual selection with default application" })

-- save
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader><leader>w", "<cmd>:Gwrite<CR>")

-- rest
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run REST Request under Cursor" })

-- lazy
vim.keymap.set("n", "<leader><leader>1", "<cmd>Lazy update<CR>", { desc = "Update Plugins using Lazy" })
