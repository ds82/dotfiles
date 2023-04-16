--local term = require("toggleterm")
--term.setup {
--    on_config_done = nil,
--    -- size can be a number or function which is passed the current terminal
--    size = 20,
--    hidden = true,
--    -- open_mapping = [[<c-\>]],
--    open_mapping = [[<F1>]],
--    hide_numbers = true, -- hide the number column in toggleterm buffers
--    shade_filetypes = {},
--    shade_terminals = true,
--    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
--    start_in_insert = true,
--    insert_mappings = true, -- whether or not the open mapping applies in insert mode
--    persist_size = false,
--    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
--    direction = "float",
--    close_on_exit = true, -- close the terminal window when the process exits
--    -- shell = vim.o.shell, -- change the default shell
--    shell = "zsh", -- change the default shell
--    -- This field is only relevant if direction is set to 'float'
--    float_opts = {
--        -- The border key is *almost* the same as 'nvim_win_open'
--        -- see :h nvim_win_open for details on borders however
--        -- the 'curved' border is a custom border type
--        -- not natively supported but implemented in this plugin.
--        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
--        border = "single",
--        -- width = <value>,
--        -- height = <value>,
--        winblend = 0,
--        highlights = {
--            border = "FloatBorder",
--            background = "Normal",
--        },
--    },
--    -- execs = {
--    --     { "lazygit", "gg", "LazyGit" },
--    -- },
--}

--function _G.set_terminal_keymaps()
--  local opts = { noremap = true }
--  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
--  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
--  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
--end

---- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

----> lazygit
---- local Terminal = require('toggleterm.terminal').Terminal
---- local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

---- function _lazygit_toggle()
----   lazygit:toggle()
---- end

---- vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

----> ranger
---- local Terminal = require('toggleterm.terminal').Terminal
---- local ranger   = Terminal:new({ cmd = "ranger", hidden = true, close_on_exit = true })

---- function _ranger_toggle()
----   ranger:toggle()
---- end

---- vim.api.nvim_set_keymap("n", "-", "<cmd>lua _ranger_toggle()<CR>", { noremap = true, silent = true })
