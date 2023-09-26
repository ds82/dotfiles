function SetColors(color)
  -- color = color or "tokyonight"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
end

-- SetColors("tokyonight")
-- SetColors("kanagawa")
-- SetColors("nordic")
-- SetColors("dracula")
-- SetColors("srcery")
--

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.4, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
  },
  custom_highlights = {},
  integrations = {
    noice = true,
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

SetColors("catppuccin-mocha")

vim.schedule(function() vim.o.background = "dark" end)
