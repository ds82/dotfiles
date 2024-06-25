return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local on_attach = require("dennis-io.core.lsp.on_attach")
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Info = " ", Hint = "󰠠 ", Warn = " ", Error = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			severity_sort = true,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		local function ts_organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = "",
			}
			vim.lsp.buf.execute_command(params)
		end

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable(false)
				vim.lsp.inlay_hint.enable(true)
				on_attach(client, bufnr)
			end,
			commands = {
				TSOrganizeImports = {
					ts_organize_imports,
					description = "Organize Imports",
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		-- lspconfig["tailwindcss"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure svelte server
		-- lspconfig["svelte"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = function(client, bufnr)
		-- 		on_attach(client, bufnr)
		--
		-- 		vim.api.nvim_create_autocmd("BufWritePost", {
		-- 			pattern = { "*.js", "*.ts" },
		-- 			callback = function(ctx)
		-- 				if client.name == "svelte" then
		-- 					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		-- 				end
		-- 			end,
		-- 		})
		-- 	end,
		-- })

		-- configure prisma orm server
		-- lspconfig["prismals"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure graphql language server
		-- lspconfig["graphql"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		-- })

		-- configure emmet language server
		-- lspconfig["emmet_ls"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		-- })

		-- configure clangd
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ccls"].setup({
			use_defaults = true,
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
