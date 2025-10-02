-- ~/.config/nvim/minimal.lua
vim.opt.runtimepath:append("~/.local/share/nvim/site/pack/packer/start/nvim-treesitter")

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
}

