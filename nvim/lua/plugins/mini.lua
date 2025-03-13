return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup()

      local starter = require("mini.starter")
      starter.setup()
    end,
  },
  {
    "echasnovski/mini.icons",
    version = "*",
    opts = {},
  },
}
