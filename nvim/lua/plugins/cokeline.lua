return {
  'willothy/nvim-cokeline',
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and get_hex('ColorColumn', 'bg')
              or get_hex('Normal', 'fg')
        end,
        bg = function(buffer)
          return
              buffer.is_focused
              and get_hex('Normal', 'fg')
              or get_hex('ColorColumn', 'bg')
        end,
      },

      components = {
        {
          text = function(buffer) return ' ' .. buffer.devicon.icon end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          underline = function(buffer)
            return buffer.is_hovered and not buffer.is_focused
          end
        },
        {
          text = ' ',
        }
      },
    })
  end
}
