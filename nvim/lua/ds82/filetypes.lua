local api = vim.api

api.nvim_create_autocmd(
	{ "BufReadPost", "BufNewFile" },
	{ pattern = { "*.things", "*.items" }, command = "set filetype=java" }
)
