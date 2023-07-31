local vim = vim
local opt = vim.opt


-- vim.opt.guicursor = ""
vim.opt.cursorline     = true
vim.opt.clipboard      = 'unnamedplus'

vim.opt.nu             = true
vim.opt.relativenumber = true

vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true

vim.opt.smartindent    = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.wrap           = false

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.hlsearch       = true
vim.opt.incsearch      = true

vim.opt.termguicolors  = true

vim.opt.scrolloff      = 8
vim.opt.signcolumn     = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "60,72"


-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- other
vim.opt.listchars = { eol = '↲', tab = '▸ ', trail = '·', space = '·' }
vim.opt.list = true


local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

vim.api.nvim_create_autocmd(
	'VimResized',
	{
		group = wr_group,
		pattern = '*',
		command = 'wincmd =',
		desc = 'Automatically resize windows when the host window size changes.'
	}
)
