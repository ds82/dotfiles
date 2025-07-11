-- vim.g.rustaceanvim = {
--
-- 	---@type RustaceanToolsOpts
-- 	tools = {
-- 		auto_focus = true,
-- 	},
-- 	---@type RustaceanLspClientOpts
-- 	server = {
-- 		on_attach = function(client, bufnr)
-- 			vim.lsp.inlay_hint.enable(false)
-- 			vim.lsp.inlay_hint.enable(true)
-- 			on_attach(client, bufnr)
-- 		end,
-- 		default_settings = {
-- 			-- 	-- rust-analyzer language server configuration
-- 			["rust-analyzer"] = {},
-- 		},
-- 	},
-- 	---@type RustaceanDapOpts
-- 	dap = {},
-- }

-- vim.g.rustaceanvim = {
-- 	server = {
-- 		on_attach = function(client, _)
-- 			client.server_capabilities.workspace.didChangeWatchedFiles = {
-- 				dynamicRegistration = false,
-- 				relativePatternSupport = false,
-- 			}
-- 		end,
-- 	},
-- }
local on_attach = require("dennis-io.core.lsp.on_attach")

-- vim.g.rustaceanvim = {
-- 	-- Plugin configuration
-- 	tools = {},
-- 	-- LSP configuration
-- 	server = {
-- 		-- on_attach = function(client, bufnr)
-- 		-- 	-- you can also put keymaps in here
-- 		-- end,
-- 		on_attach = function(client, bufnr)
-- 			client.server_capabilities.workspace.didChangeWatchedFiles = {
-- 				dynamicRegistration = false,
-- 				relativePatternSupport = false,
-- 			}
-- 			on_attach(client, bufnr)
-- 		end,
-- 		default_settings = {
-- 			-- rust-analyzer language server configuration
-- 		},
-- 		["rust-analyzer"] = {
-- 			assist = {
-- 				importEnforceGranularity = true,
-- 				importPrefix = "create",
-- 			},
-- 			cargo = { allFeatures = true },
-- 			checkOnSave = {
-- 				-- default: `cargo check` but `clippy` can be used too.
-- 				command = "cargo check",
-- 				allFeatures = true,
-- 			},
-- 			inlayHints = {
-- 				lifetimeElisionHints = {
-- 					enable = true,
-- 					useParameterNames = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	-- DAP configuration
-- 	dap = {},
-- }

-- vim.g.rustaceanvim = {
-- 	server = {
-- 		settings = {
-- 			on_attach = function(client, bufnr)
-- 				client.server_capabilities.workspace.didChangeWatchedFiles = {
-- 					dynamicRegistration = false,
-- 					relativePatternSupport = false,
-- 				}
-- 				on_attach(client, bufnr)
-- 			end,
--
-- 			["rust-analyzer"] = {
-- 				cargo = { allFeatures = true },
-- 				checkOnSave = true,
-- 				inlayHints = {
-- 					lifetimeElisionHints = {
-- 						enable = true,
-- 						useParameterNames = true,
-- 					},
-- 				},
-- 				check = {
-- 					enable = true,
-- 					command = "clippy",
-- 					features = "all",
-- 				},
-- 				procMacro = {
-- 					enable = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- }

---@type rustaceanvim.Opts
vim.g.rustaceanvim = {
	---@type rustaceanvim.tools.Opts
	tools = {
		-- ...
	},
	---@type rustaceanvim.lsp.ClientOpts
	server = {
		on_attach = function(client, bufnr)
			client.server_capabilities.workspace.didChangeWatchedFiles = {
				dynamicRegistration = false,
				relativePatternSupport = false,
			}
			on_attach(client, bufnr)
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			---@type rustaceanvim.lsp.server.default_settings.rust-analyzer
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = true,
				inlayHints = {
					lifetimeElisionHints = {
						enable = true,
						useParameterNames = true,
					},
				},
				check = {
					enable = true,
					command = "clippy",
					features = "all",
				},
				procMacro = {
					enable = true,
				},
				diagnostics = {
					enable = true,
				},
			},
		},
		-- ...
	},
	---@type rustaceanvim.dap.Opts
	dap = {
		-- ...
	},
}

return {
	"mrcjkb/rustaceanvim",
	version = "^6", -- Recommended
	lazy = false, -- This plugin is already lazy
}
