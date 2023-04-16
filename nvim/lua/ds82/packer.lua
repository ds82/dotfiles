-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
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
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}
	use { 'simrat39/rust-tools.nvim' }

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
		tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	}

	use { 'numToStr/FTerm.nvim' }


	-- use { 'github/copilot.vim' }
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup(require("ds82.copilot"))
		end
	}
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end
	}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
		end
	}

	-- https://github.com/MunifTanjim/prettier.nvim
	-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/17

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use('MunifTanjim/prettier.nvim')



	use { 'ojroques/vim-oscyank', branch = 'v1.0.0' }

	use {
		"nvim-neorg/neorg",
		config = function()
			require('neorg').setup {
				load = {
					["core.defaults"] = {},  -- Loads default behaviour
					["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
					["core.norg.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "~/ownCloud/notes/work",
								home = "~/ownCloud/notes/home",
							},
						},
					},
				},
			}
		end,
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	}

	use {
		'glepnir/dashboard-nvim',
		branch = 'master',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = 'hyper',
				shortcut_type = 'number',
				config = {}, --  config used for theme
				hide = {
					statusline = 'true',
					tabline = 'true',
					winbar = 'true',
				},
				preview = {
				},
			}
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				auto_preview = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use 'HiPhish/nvim-ts-rainbow2'

	-- use 'echasnovski/mini.nvim'
	-- use {
	--     "folke/which-key.nvim",
	--     config = function()
	--       vim.o.timeout = true
	--       vim.o.timeoutlen = 300
	--       require("which-key").setup {
	--           -- your configuration comes here
	--           -- or leave it empty to use the default settings
	--           -- refer to the configuration section below
	--       }
	--     end
	-- }

	-- use({
	-- 	"folke/noice.nvim",
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			-- add any options here
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	}
	-- })
end)
