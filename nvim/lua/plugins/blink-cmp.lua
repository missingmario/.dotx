return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "mono"
    },

    sources = {
      default = {
        "lazydev",
        "lsp", "path", "snippets", "buffer",
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        }
      },
    },

    fuzzy = {
      implementation = "lua"
    }
  },
}
