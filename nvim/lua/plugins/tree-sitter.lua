return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local plugin = require("nvim-treesitter.configs")
    plugin.setup {
      ensure_installed = {
        "lua", "luadoc", "vim", "vimdoc", "query",
        "bash",
        "c",
        "html", "markdown", "markdown_inline",
        "nix",
        "zig",
      },

      auto_install = true,

      highlight = {
        enable = true
      },
    }
  end,
}
