-- local parser_mapping = require("nvim-treesitter.parsers").filetype_to_parsername
-- parser_mapping.xml = "html" -- map the html parser to be used when using xml files

require 'nvim-treesitter.configs'.setup {
  ignore_install = { 'help' },
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "help", "javascript", "typescript", "c", "lua", "rust", "bash", "c_sharp", "dockerfile",
    "git_rebase", "git_config", "gitcommit", "haskell", "html", "http", "jq", "json", "make", "markdown",
    "markdown_inline", "norg", "vimdoc",
    "toml", "tsx", "regex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.treesitter.language.register('html', 'xml')
