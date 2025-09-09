-- Bullets.vim is a Vim plugin for automated bullet lists.
return {
	"bullets-vim/bullets.vim",
	setup = function()
		vim.g.bullets_enabled_file_types = {
			"markdown",
			"text",
			"gitcommit",
			"gitrebase",
			"gitconfig",
		}
	end,
}
