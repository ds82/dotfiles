return {
	"echasnovski/mini.starter",
	-- event = "VimEnter",
	config = function()
		local starter = require("mini.starter")
		starter.setup({
			header = table.concat({
				[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
				[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
				[[/ /\  /  __/ (_) \ V /| | | | | | |]],
				[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
				[[───────────────────────────────────]],
			}, "\n"),

			items = {
				{
					name = "Restore Session",
					action = "lua require('persistence').load()",
					section = "Session",
				},
				starter.sections.recent_files(10, true),
				starter.sections.builtin_actions(),
			},
		})
	end,
}
