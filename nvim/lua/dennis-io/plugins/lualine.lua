return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin-mocha",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						-- Is it me or the symbol for modified us really weird
						symbols = { added = " ", modified = "󰝤 ", removed = " " },
						diff_color = {
							added = { fg = mocha.green },
							modified = { fg = mocha.peach },
							removed = { fg = mocha.red },
						},
					},
				},
				lualine_c = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					-- { "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
