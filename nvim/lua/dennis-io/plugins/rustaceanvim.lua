local on_attach = require("dennis-io.core.lsp.on_attach")
vim.g.rustaceanvim = {

	---@type RustaceanToolsOpts
	tools = {
		auto_focus = true,
	},
	---@type RustaceanLspClientOpts
	server = {
		on_attach = function(client, bufnr)
			vim.lsp.inlay_hint.enable(bufnr, false)
			vim.lsp.inlay_hint.enable(bufnr, true)
			on_attach(client, bufnr)
		end,
		default_settings = {
			-- 	-- rust-analyzer language server configuration
			["rust-analyzer"] = {},
		},
	},
	---@type RustaceanDapOpts
	dap = {},
}

return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function() end,
}
