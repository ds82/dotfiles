local lsp = require("lsp-zero").preset({})
local telescope = require("telescope.builtin")
local null_ls = require("null-ls")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
	vim.keymap.set("n", "gD", vim.lsp.buf.implementation, { desc = "" })
	vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "" })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "" })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "" })

	vim.keymap.set("n", "gW", telescope.lsp_dynamic_workspace_symbols, { desc = "" })
	vim.keymap.set("n", "gB", telescope.lsp_document_symbols, { desc = "" })
	vim.keymap.set("n", "gW", telescope.lsp_dynamic_workspace_symbols, { desc = "" })
	vim.keymap.set("n", "gB", telescope.lsp_document_symbols, { desc = "" })

	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "" })
	vim.keymap.set("n", "[e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "" })
	vim.keymap.set("n", "]e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "" })
	vim.keymap.set("n", "<leader>H", vim.lsp.buf.signature_help, { desc = "" })

	-- vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
	--   vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	-- end)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").tsserver.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
})

lsp.format_mapping("<leader>f", {
	servers = {
		["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		["null-ls"] = {
			"javascript",
			"typescript",
			"typescriptreact",
			"javascriptreact",
			"markdown",
			"json",
			"yaml",
			"html",
			"css",
		},
	},
})

lsp.format_on_save({
	servers = {
		["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		["null-ls"] = {
			"javascript",
			"typescript",
			"typescriptreact",
			"javascriptreact",
			"markdown",
			"json",
			"html",
			"css",
		},
	},
})

lsp.ensure_installed({
	-- Replace these with whatever servers you want to install
	"tsserver",
	"eslint",
	"rust_analyzer",
})

lsp.setup()

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettier_eslint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
	},
})
