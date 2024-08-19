return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "gopls",
      "html",
      "jsonls",
      "rust_analyzer",
      "tsserver",
      "yamlls",
    },
    automatic_installation = true,
  },
  dependencies = "williamboman/mason.nvim",
}
