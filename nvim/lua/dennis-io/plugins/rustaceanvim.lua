local on_attach = require("dennis-io.core.lsp.on_attach")

return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			---@type RustaceanToolsOpts
			tools = {},
			---@type RustaceanLspClientOpts
			server = {
				on_attach = on_attach,
				-- default_settings = {
				-- 	-- rust-analyzer language server configuration
				-- 	["rust-analyzer"] = {},
				-- },
			},
			-- ---@type RustaceanDapOpts
			-- dap = {
			-- },
		}
	end,
}
