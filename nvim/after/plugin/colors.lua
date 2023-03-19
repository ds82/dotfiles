function SetColors(color)
  color = color or "tokyonight"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- SetColors("kanagawa")
SetColors()
