require("luasnip.session.snippet_collection").clear_snippets("typescript")
require("luasnip.session.snippet_collection").clear_snippets("typescriptreact")

local ls = require("luasnip")

local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
	s("debugger", fmt("debugger; // eslint-disable-line no-debugger", {})),
})
ls.add_snippets("typescriptreact", {
	s("debugger", fmt("debugger; // eslint-disable-line no-debugger", {})),
})
