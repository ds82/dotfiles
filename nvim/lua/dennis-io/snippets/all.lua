local ls = require("luasnip")

local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {
	s("codefence", {
		t("```"),
		i(1, "language"),
		t({ "", "" }),
		i(2, "code"),
		t({ "", "```" }),
	}),
})

-- Function to insert the code fence snippet
local function insert_codefence()
	ls.snip_expand(s("codefence", {
		t("```"),
		i(1, "language"),
		t({ "", "" }),
		i(2, "code"),
		t({ "", "```" }),
	}))
end

-- Key mapping to insert the code fence snippet
vim.keymap.set("i", "<C-y>", insert_codefence, { noremap = true, silent = true })
