return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local blink = require("blink.cmp")

    local servers = {
      lua_ls = {},
      nixd = {},
      zls = {},
    }

    for server, config in pairs(servers) do
      local capabilities = blink.get_lsp_capabilities(config.capabilities)
      config.capabilities = capabilities

      lspconfig[server].setup(config)
    end
  end
}
