local win_config = function()
	local height = math.floor(0.618 * vim.o.lines)
	local width = math.floor(0.618 * vim.o.columns)
	return {
		anchor = "NW",
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
	}
end

return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		local pick = require("mini.pick")
		local extra = require("mini.extra")

		pick.setup({
			window = {
				-- relative = 'editor' makes positioning relative to whole Neovim window
				config = win_config,
			},
		})
		extra.setup()

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>D", function()
			extra.pickers.diagnostic()
		end, {})
	end,
}
