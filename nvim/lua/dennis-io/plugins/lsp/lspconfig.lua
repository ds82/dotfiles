return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			automatic_enable = false,
		},
		config = function()
			-- todo: load on use
			local telescope = require("telescope.builtin")

			local config = {
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "single",
					source = "always",
					header = "",
					prefix = "",
					suffix = "",
				},
			}
			vim.diagnostic.config(config)

			-- Improve LSPs UI {{{
			local icons = {
				Class = " ",
				Color = " ",
				Constant = " ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Folder = " ",
				Function = "󰊕 ",
				Interface = " ",
				Keyword = " ",
				Method = "ƒ ",
				Module = "󰏗 ",
				Property = " ",
				Snippet = " ",
				Struct = " ",
				Text = " ",
				Unit = " ",
				Value = " ",
				Variable = " ",
			}

			local completion_kinds = vim.lsp.protocol.CompletionItemKind
			for i, kind in ipairs(completion_kinds) do
				completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
			end
			-- }}}

			-- Lsp capabilities and on_attach {{{
			-- Here we grab default Neovim capabilities and extend them with ones we want on top
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = true,
				lineFoldingOnly = true,
			}

			capabilities.textDocument.semanticTokens.multilineTokenSupport = true
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local ok, diag = pcall(require, "rj.extras.workspace-diagnostic")
					if ok then
						diag.populate_workspace_diagnostics(client, bufnr)
					end
				end,
			})
			-- }}}

			vim.lsp.enable({
				"lua_ls",
				-- rust_analyzer is started by rustaceanvim
				-- "rust_analyzer",
				"ts_ls",
			})

			-- Disable the default keybinds {{{
			for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
				pcall(vim.keymap.del, "n", bind)
			end
			-- }}}

			-- Create keybindings, commands, inlay hints and autocommands on LSP attach {{{
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local bufnr = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if not client then
						return
					end
					---@diagnostic disable-next-line need-check-nil
					if client.server_capabilities.completionProvider then
						vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
						-- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
					end
					---@diagnostic disable-next-line need-check-nil
					if client.server_capabilities.definitionProvider then
						vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
					end

					-- -- nightly has inbuilt completions, this can replace all completion plugins
					-- if client:supports_method("textDocument/completion", bufnr) then
					--   -- Enable auto-completion
					--   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
					-- end

					--- Disable semantic tokens
					---@diagnostic disable-next-line need-check-nil
					client.server_capabilities.semanticTokensProvider = nil

    -- All the keymaps
    -- stylua: ignore start
    local keymap = vim.keymap
    local lsp = vim.lsp
    local opts = { silent = true, buffer = bufnr }
					local function opt(desc, others)
					  return vim.tbl_extend("force", opts, { desc = desc }, others or {})
					end


	opts.desc = "goto definition"
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	opts.desc = ""
	keymap.set("n", "gD", vim.lsp.buf.implementation, opts)

	opts.desc = ""
	keymap.set("n", "gr", telescope.lsp_references, opts)

	-- opts.desc = ""
	-- keymap.set("n", "gr", vim.lsp.buf.references, opts)

	opts.desc = ""
	keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

	opts.desc = ""
	keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = ""
	keymap.set("n", "gB", telescope.lsp_document_symbols, opts)

	opts.desc = ""
	keymap.set("n", "gW", telescope.lsp_dynamic_workspace_symbols, opts)

	opts.desc = ""
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = ""
	keymap.set("n", "[d", vim.diagnostic.goto_next, opts)

	opts.desc = ""
	keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

	opts.desc = ""
	keymap.set("n", "[e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

	opts.desc = ""
	vim.keymap.set("n", "]e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

	opts.desc = ""
	keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = ""
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	opts.desc = ""
	keymap.set("n", "<leader>H", vim.lsp.buf.signature_help, opts)

					--  opts.desc = "Show LSP references"
					--  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
					-- keymap.set("n", "gr", telescope.lsp_references, { desc = "" })
					--
					--  opts.desc = "Go to declaration"
					--  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
					--
					--  opts.desc = "Show LSP definitions"
					--  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
					--
					--  opts.desc = "Show LSP implementations"
					--  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
					--
					--  opts.desc = "Show LSP type definitions"
					--  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
					--
					--  opts.desc = "See available code actions"
					--  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
					--
					--  opts.desc = "Smart rename"
					--  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
					--
					--  opts.desc = "Show buffer diagnostics"
					--  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
					--
					--  opts.desc = "Show line diagnostics"
					--  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
					--
					--  opts.desc = "Go to previous diagnostic"
					--  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
					--
					--  opts.desc = "Go to next diagnostic"
					--  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
					--
					--  opts.desc = "Show documentation for what is under cursor"
					--  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
					--
					--  opts.desc = "Restart LSP"
					--  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			})
			--
			-- }}}

			-- end: config
		end,
	},
}

-- return {
-- 	"neovim/nvim-lspconfig",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		{ "antosha417/nvim-lsp-file-operations", config = true },
-- 	},
-- 	config = function()
-- 		-- import lspconfig plugin
-- 		local on_attach = require("dennis-io.core.lsp.on_attach")
-- 		local lspconfig = require("lspconfig")
--
-- 		-- import cmp-nvim-lsp plugin
-- 		local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
-- 		-- used to enable autocompletion (assign to every lsp server config)
-- 		local capabilities = cmp_nvim_lsp.default_capabilities()
--
-- 		-- Change the Diagnostic symbols in the sign column (gutter)
-- 		-- (not in youtube nvim video)
-- 		local signs = { Info = " ", Hint = "󰠠 ", Warn = " ", Error = " " }
-- 		for type, icon in pairs(signs) do
-- 			local hl = "DiagnosticSign" .. type
-- 			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- 		end
--
-- 		vim.diagnostic.config({
-- 			severity_sort = true,
-- 		})
--
-- 		-- configure html server
-- 		lspconfig["html"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 		})
--
-- 		lspconfig["bashls"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 		})
--
-- 		lspconfig["graphql"].setup({
-- 			capabilities = capabilities,
-- 			autostart = false,
-- 			on_attach = on_attach,
-- 		})
-- 		lspconfig["emmet_ls"].setup({
-- 			capabilities = capabilities,
-- 			autostart = false,
-- 			on_attach = on_attach,
-- 		})
--
-- 		-- configure typescript server with plugin
-- 		local function ts_organize_imports()
-- 			local params = {
-- 				command = "_typescript.organizeImports",
-- 				arguments = { vim.api.nvim_buf_get_name(0) },
-- 				title = "",
-- 			}
-- 			vim.lsp.buf.execute_command(params)
-- 		end
--
-- 		lspconfig["ts_ls"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = function(client, bufnr)
-- 				-- vim.lsp.inlay_hint.enable(false)
-- 				-- vim.lsp.inlay_hint.enable(true)
-- 				on_attach(client, bufnr)
-- 			end,
-- 			commands = {
-- 				TSOrganizeImports = {
-- 					ts_organize_imports,
-- 					description = "Organize Imports",
-- 				},
-- 			},
-- 		})
--
-- 		-- configure css server
-- 		lspconfig["cssls"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 		})
--
-- 		-- configure tailwindcss server
-- 		-- lspconfig["tailwindcss"].setup({
-- 		-- 	capabilities = capabilities,
-- 		-- 	on_attach = on_attach,
-- 		-- })
--
-- 		-- configure svelte server
-- 		-- lspconfig["svelte"].setup({
-- 		-- 	capabilities = capabilities,
-- 		-- 	on_attach = function(client, bufnr)
-- 		-- 		on_attach(client, bufnr)
-- 		--
-- 		-- 		vim.api.nvim_create_autocmd("BufWritePost", {
-- 		-- 			pattern = { "*.js", "*.ts" },
-- 		-- 			callback = function(ctx)
-- 		-- 				if client.name == "svelte" then
-- 		-- 					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
-- 		-- 				end
-- 		-- 			end,
-- 		-- 		})
-- 		-- 	end,
-- 		-- })
--
-- 		-- configure prisma orm server
-- 		-- lspconfig["prismals"].setup({
-- 		-- 	capabilities = capabilities,
-- 		-- 	on_attach = on_attach,
-- 		-- })
--
-- 		-- configure graphql language server
-- 		-- lspconfig["graphql"].setup({
-- 		-- 	capabilities = capabilities,
-- 		-- 	on_attach = on_attach,
-- 		-- 	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
-- 		-- })
--
-- 		-- configure emmet language server
-- 		-- lspconfig["emmet_ls"].setup({
-- 		-- 	capabilities = capabilities,
-- 		-- 	on_attach = on_attach,
-- 		-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- 		-- })
--
-- 		-- configure clangd
-- 		lspconfig["clangd"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = function(client, bufnr)
-- 				-- client.server_capabilities.signatureHelpProvider = false
-- 				on_attach(client, bufnr)
-- 			end,
-- 		})
--
-- 		-- configure python server
-- 		lspconfig["pyright"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 		})
--
-- 		-- configure lua server (with special settings)
-- 		lspconfig["lua_ls"].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 			settings = { -- custom settings for lua
-- 				Lua = {
-- 					-- make the language server recognize "vim" global
-- 					diagnostics = {
-- 						globals = { "vim" },
-- 					},
-- 					workspace = {
-- 						-- make language server aware of runtime files
-- 						library = {
-- 							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 							[vim.fn.stdpath("config") .. "/lua"] = true,
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		-- 	lspconfig["rust_analyzer"].setup({
-- 		-- 		capabilities = capabilities,
-- 		-- 		on_attach = function(client, bufnr)
-- 		-- 			-- client.server_capabilities.signatureHelpProvider = false
-- 		-- 			on_attach(client, bufnr)
-- 		-- 		end,
-- 		-- 		settings = {
-- 		-- 			["rust-analyzer"] = {
-- 		-- 				cargo = {
-- 		-- 					allFeatures = true,
-- 		-- 				},
-- 		-- 				procMacro = {
-- 		-- 					enable = true,
-- 		-- 				},
-- 		-- 			},
-- 		-- 		},
-- 		-- 	})
-- 	end,
-- }
