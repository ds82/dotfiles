vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>grc", function() 
  vim.cmd(':G rebase --continue')
end)

