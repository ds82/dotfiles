local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'copilot' },
		{ name = 'nvim_lsp' },
	},
	mapping = {
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({
			-- documentation says this is important.
			-- I don't know why.
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		})
	}
})
