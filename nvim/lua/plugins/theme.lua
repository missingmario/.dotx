return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function()
    local plugin = require "catppuccin"
    plugin.setup {}

    vim.cmd.colorscheme("catppuccin")
  end,
}
