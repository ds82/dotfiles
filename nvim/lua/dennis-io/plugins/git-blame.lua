return {
	"f-person/git-blame.nvim",
	init = function()
		vim.g.gitblame_message_template = "  <author> • <date> • <summary> • <sha>"
	end,
	event = "VeryLazy",
}
