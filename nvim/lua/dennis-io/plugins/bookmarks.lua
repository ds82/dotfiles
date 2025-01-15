return {
	"LintaoAmons/bookmarks.nvim",
	-- recommand, pin the plugin at specific version for stability
	-- backup your db.json file when you want to upgrade the plugin
	tag = "v2.0.0",
	dependencies = {
		{ "kkharji/sqlite.lua" },
		{ "nvim-telescope/telescope.nvim" },
		{ "stevearc/dressing.nvim" }, -- optional: better UI
	},
	keys = {
		{ "mm", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." } },
	},
	config = function()
		local opts = {} -- go to the following section to see all the options
		require("bookmarks").setup(opts) -- you must call setup to init sqlite db
	end,
}
