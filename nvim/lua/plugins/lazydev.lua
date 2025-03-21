return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      {
        path = "${3rd}/lub/library",
        words = { "vim%.uv" },
      }
    }
  },
}
