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
	use 'AlexvZyl/nordic.nvim'
	use { 'srcery-colors/srcery-vim', as = 'srcery' }
	use 'rafalbromirski/vim-aurora'
	use { "ellisonleao/gruvbox.nvim" }
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'sainnhe/edge'

	use 'nvim-tree/nvim-web-devicons'


	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { 'nvim-treesitter/playground' }

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
	-- use { "ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	requires = { "nvim-tree/nvim-web-devicons" }
	-- }


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

	use { "akinsho/toggleterm.nvim", tag = '*' }

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



	-- use { 'ojroques/vim-oscyank', branch = 'v1.0.0' }
	use { 'ojroques/nvim-osc52', branch = 'main' }

	use {
		"nvim-neorg/neorg",
		-- branch = "v2.0.1",
		config = function()
			require('neorg').setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "~/ownCloud/notes/work",
								home = "~/ownCloud/notes/home",
							},
						},
					},
					["core.export"] = {},
					["core.export.markdown"] = {}
				},
			}
		end,
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	}

	-- use {
	-- 	'glepnir/dashboard-nvim',
	-- 	branch = 'master',
	-- 	event = 'VimEnter',
	-- 	config = function()
	-- 		require('dashboard').setup {
	-- 			theme = 'hyper',
	-- 			shortcut_type = 'number',
	-- 			config = {}, --  config used for theme
	-- 			hide = {
	-- 				statusline = 'true',
	-- 				tabline = 'true',
	-- 				winbar = 'true',
	-- 			},
	-- 			preview = {
	-- 			},
	-- 		}
	-- 	end,
	-- 	requires = { 'nvim-tree/nvim-web-devicons' }
	-- }

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
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

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


	-- use { "Cassin01/wf.nvim", config = function() require("wf").setup() end }

	use 'wakatime/vim-wakatime'

	-- use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
	use 'romgrk/barbar.nvim'


	use { 'echasnovski/mini.starter', branch = 'stable' }

	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	use 'folke/flash.nvim'

	use {
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require('neotest').setup({
				adapters = {
					require('neotest-jest')({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				}
			})
		end
	}
	use {
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = '.env',
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end
	}

	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
end)
