return {
  "folke/todo-comments.nvim",
  config = function()
    require("todo-comments").setup {
      auto_preview = false,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
