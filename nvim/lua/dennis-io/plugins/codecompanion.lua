return {
	"olimorris/codecompanion.nvim",
	branch = "main",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- The following are optional:
		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
	},
	config = true,
	keys = {
		{ "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>" },
	},
	opts = {
		display = {
			chat = {
				window = {
					layout = "float", -- float|vertical|horizontal|buffer
					width = 0.9,
				},
			},
		},
		strategies = {
			chat = {
				adapter = "copilot",
			},
			inline = {
				adapter = "copilot",
			},
		},
	},
}
