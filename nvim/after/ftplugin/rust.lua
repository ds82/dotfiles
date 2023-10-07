vim.keymap.set("n", "gK", ":RustOpenExternalDocs<CR>")

vim.cmd [[
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
]]

vim.opt.listchars = { tab = '  ', eol = '↲', trail = '·' }
vim.opt.list = true
