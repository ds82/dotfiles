local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = false

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true
opt.incsearch = true

-- undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- cursor line
opt.cursorline = true -- highlight the current cursor line
opt.colorcolumn = "60,72"

-- listchars (non printable ..)
vim.opt.listchars = { eol = "↲", tab = "▸ ", trail = "·", space = "·" }
vim.opt.list = true

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.scrolloff = 8

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- window resize
local wr_group = vim.api.nvim_create_augroup("WinResize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
	group = wr_group,
	pattern = "*",
	command = "wincmd =",
	desc = "Automatically resize windows when the host window size changes.",
})

-- disable swapfile
opt.swapfile = false

-- color status column based on error/warning
-- works with neovim >= 0.11
-- https://www.reddit.com/r/neovim/comments/1ikb7hm/heres_how_to_enable_line_number_colors_as/?utm_source=pocket_saves
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%l%s"

-- lsp inline hints
if vim.lsp.inlay_hint then
	vim.lsp.inlay_hint.enable(true, { 0 })
end

opt.jumpoptions = "stack" -- jump to previous location in the stack when using `Ctrl-o` or `Ctrl-i`
