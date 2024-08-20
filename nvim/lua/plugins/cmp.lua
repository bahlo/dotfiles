return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          else
            fallback()
          end
        end, { "i", "s" })
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
    })
  end
}
