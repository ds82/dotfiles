local t = require('telescope');
local builtin = require('telescope.builtin')

t.setup({
    defaults = {
        ripgrep_arguments = {
            'rg',
            '--hidden',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore-file',
            '.gitignore'
        },
    },
})



vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>t', builtin.find_files, {})

vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>b', builtin.buffers)

-- vim.keymap.set('n', '<C-o>', builtin.lsp_dynamic_workspace_symbols)
