local telescope = require("telescope.builtin")
local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }
local on_attach = function(_client, bufnr)
	opts.buffer = bufnr

	-- set keybinds
	opts.desc = "goto definition"
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	opts.desc = ""
	keymap.set("n", "gD", vim.lsp.buf.implementation, opts)

	opts.desc = ""
	keymap.set("n", "gr", telescope.lsp_references, opts)

	opts.desc = ""
	keymap.set("n", "gr", vim.lsp.buf.references, opts)

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
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

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
end

return on_attach
