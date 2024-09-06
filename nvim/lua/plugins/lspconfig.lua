return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-lspconfig").setup_handlers {
      function(server_name)
        -- https://github.com/williamboman/mason-lspconfig.nvim/issues/458
        if server_name == "tsserver" then
          server_name = "ts_ls"
        end
        require("lspconfig")[server_name].setup {}
      end,
    }
  end
}
