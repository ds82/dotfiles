--[[
{
  base = "#1e1e2e",
  blue = "#89b4fa",
  crust = "#11111b",
  flamingo = "#f2cdcd",
  green = "#a6e3a1",
  lavender = "#b4befe",
  mantle = "#181825",
  maroon = "#eba0ac",
  mauve = "#cba6f7",
  overlay0 = "#6c7086",
  overlay1 = "#7f849c",
  overlay2 = "#9399b2",
  peach = "#fab387",
  pink = "#f5c2e7",
  red = "#f38ba8",
  rosewater = "#f5e0dc"
  sapphire = "#74c7ec",
  sky = "#89dceb",
  subtext0 = "#a6adc8",
  subtext1 = "#bac2de",
  surface0 = "#313244",
  surface1 = "#45475a",
  surface2 = "#585b70",
  teal = "#94e2d5",
  text = "#cdd6f4",
  yellow = "#f9e2af"
}
--]]
--
function SetColors(color)
	local colors = require("catppuccin.palettes").get_palette("mocha")

	color = color or "catppuccin-mocha"
	-- color = color or "tokyonight"
	vim.o.termguicolors = true
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "BufferCurrent", { bg = colors.crust })
	vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = colors.crust })
	vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = colors.crust })
end

return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false, -- disables setting the background color.
		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "light",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			alpha = true,
			barbar = true,
			flash = true,
			illuminate = true,
			indent_blankline = { enabled = true },
			lsp_trouble = true,
			mason = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			navic = { enabled = true, custom_bg = "lualine" },
			neotest = true,
			noice = true,
			neotree = true,
			semantic_tokens = true,
			telescope = true,
			which_key = true,
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = true,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	},
	config = function()
		SetColors("catppuccin-mocha")
	end,
}
