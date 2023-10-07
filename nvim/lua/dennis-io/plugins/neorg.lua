return {
	"nvim-neorg/neorg",
	event = "VeryLazy",
	build = ":Neorg sync-parsers",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/zen-mode.nvim",
	},
	config = function()
		require("neorg").setup({
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
				["core.export.markdown"] = {},
				["core.presenter"] = {
					config = {
						zen_mode = "zen-mode",
					},
				},
			},
		})
	end,
}
