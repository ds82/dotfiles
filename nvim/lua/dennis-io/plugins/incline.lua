return {
	"b0o/incline.nvim",
	dependencies = { "catppuccin/nvim" },
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")

		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = colors.mantle, guifg = colors.text },
					InclineNormalNC = { guibg = colors.mantle, guifg = colors.text },
				},
			},
			window = { margin = { vertical = 0, horizontal = 1 } },
			hide = {
				cursorline = true,
			},
			render = function(props)
				local helpers = require("incline.helpers")

				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				local filename_color = colors.text
				local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename)
				local guibg = colors.crust

				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
					-- guibg = colors.peach
					filename_color = colors.peach
				end

				return {
					{ icon, guifg = icon_color, guibg = guibg },
					{ filename, guifg = filename_color, guibg = guibg },
				}
			end,
		})
	end,
}
