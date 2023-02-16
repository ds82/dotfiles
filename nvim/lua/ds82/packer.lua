-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
      -- Packer can manage itself
      use 'wbthomason/packer.nvim'
      use { 'christoomey/vim-tmux-navigator' }

      use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
          -- or                            , branch = '0.1.x',
          requires = { { 'nvim-lua/plenary.nvim' } }
      }

      -- themes
      use 'folke/tokyonight.nvim'
      use 'rebelot/kanagawa.nvim'
      use 'nvim-tree/nvim-web-devicons'

      use {
          'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate'
      }
      use { 'nvim-treesitter/playground' }
      use { 'nvim-treesitter/nvim-treesitter-textobjects' }

      use { 'tpope/vim-fugitive' }
      use { 'airblade/vim-gitgutter' }

      use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
              -- LSP Support
              { 'neovim/nvim-lspconfig' }, -- Required
              { 'williamboman/mason.nvim' }, -- Optional
              { 'williamboman/mason-lspconfig.nvim' }, -- Optional

              -- Autocompletion
              { 'hrsh7th/nvim-cmp' }, -- Required
              { 'hrsh7th/cmp-nvim-lsp' }, -- Required
              { 'hrsh7th/cmp-buffer' }, -- Optional
              { 'hrsh7th/cmp-path' }, -- Optional
              { 'saadparwaiz1/cmp_luasnip' }, -- Optional
              { 'hrsh7th/cmp-nvim-lua' }, -- Optional

              -- Snippets
              { 'L3MON4D3/LuaSnip' }, -- Required
              { 'rafamadriz/friendly-snippets' }, -- Optional
          }
      }

      -- use 'lukas-reineke/lsp-format.nvim'

      use { 'tpope/vim-commentary' }
      use { 'tpope/vim-repeat' }
      use { 'f-person/git-blame.nvim' }
      use { 'tpope/vim-surround' }
      use { 'tpope/vim-unimpaired' }

      use { 'junegunn/fzf', run = 'fzf#install()' }
      use { 'junegunn/fzf.vim' }

      use { 'nvim-lua/plenary.nvim' }
      use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


      use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
      }

      use {
          'nvim-tree/nvim-tree.lua',
          requires = {
              'nvim-tree/nvim-web-devicons', -- optional, for file icons
          },
          tag = 'nightly' -- optional, updated every week. (see issue #1193)
      }

      use { 'numToStr/FTerm.nvim' }


      use { 'github/copilot.vim' }

      use {
          "folke/trouble.nvim",
          requires = "nvim-tree/nvim-web-devicons",
          config = function()
          end
      }

      -- https://github.com/MunifTanjim/prettier.nvim
      -- https://github.com/VonHeikemen/lsp-zero.nvim/issues/17
      use('jose-elias-alvarez/null-ls.nvim')
      use('MunifTanjim/prettier.nvim')
    end)
