return {
	"mistweaverco/kulala.nvim",
	keys = {
		{
			"<leader><leader>kr",
			function()
				require("kulala").run()
			end,
			desc = "kulala: run current request",
		},
		{
			"<leader><leader>kv",
			function()
				require("kulala").toggle_view()
			end,
			desc = "kulala: toggle header/body view",
		},
		{
			"<leader><leader>kl",
			function()
				require("kulala").replay()
			end,
			desc = "kulala: replay last request",
		},
		{
			"<leader><leader>kc",
			function()
				require("kulala").copy()
			end,
			desc = "kulala: copy current request as curl",
		},
	},
	config = function()
		-- Setup is required, even if you don't pass any options
		require("kulala").setup({
			debug = true,
			default_view = "headers_body",
			formatters = {
				json = { "jq", "." },
				xml = { "xmllint", "--format", "-" },
				html = { "xmllint", "--format", "--html", "-" },
			},
			-- default icons
			icons = {
				inlay = {
					loading = "⏳",
					done = "✅",
					error = "❌",
				},
				lualine = "🐼",
			},
			-- additional cURL options
			-- see: https://curl.se/docs/manpage.html
			additional_curl_options = {
				"--insecure",
			},
		})
	end,
}
