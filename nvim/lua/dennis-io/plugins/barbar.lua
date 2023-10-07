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

return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		require("barbar").setup({
			animation = false,
			icons = {
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,
					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "[", right = "]" },
			},
		})
	end,
}
