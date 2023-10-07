-- return {
-- 	"tpope/vim-surround",
-- 	event = "VeryLazy",
-- }
return {
	"echasnovski/mini.surround",
	version = false,
	config = function()
		require("mini.surround").setup()
	end,
}
