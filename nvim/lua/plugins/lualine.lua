return {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    }
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
