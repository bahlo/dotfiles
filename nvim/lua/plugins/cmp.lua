return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
    })
  end
}
