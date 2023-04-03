require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'andymass/vim-matchup', event = 'VimEnter'} -- % for language symbols

  -- Treesitter
  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    config = function() 
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "rust", "toml", "go", "typescript", "astro" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting=false,
        },
        ident = { enable = true }, 
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        matchup = {
          enable = true,
        },
      }
    end
  }
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- Navigation
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() 
      local hop = require('hop')

      hop.setup {
        keys = 'asdfhjkl',
      }

      local directions = require('hop.hint').HintDirection
      vim.keymap.set('n', '<leader>j', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR })
      end, { remap = true, desc = 'Jump forwards' })
      vim.keymap.set('n', '<leader>J', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR })
      end, { remap = true, desc = 'Jump backwards' })
    end
  }
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
        require("nvim-surround").setup {}
    end
  })
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'                             

  use 'github/copilot.vim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  }

  -- Git
  use { 
    'TimUntersberger/neogit', 
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function() 
      local neogit = require('neogit')

      neogit.setup {
        integrations = {
          diffview = true
        }
      }

      vim.keymap.set('n', '<leader>g', neogit.open, { desc = 'Neogit' })
    end
  }
  use { 
    'lewis6991/gitsigns.nvim', tag = 'v0.6',
    config = function() require('gitsigns').setup() end
  }

  -- UI
  -- use {
  --   "projekt0n/circles.nvim",
  --   requires = {"nvim-tree/nvim-web-devicons"},
  --   config = function()
  --     require("circles").setup()
  --   end
  -- }
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {enable = false}

      vim.keymap.set('n', '<C-h>', ':TablineBufferPrevious<cr>', {})
      vim.keymap.set('n', '<C-l>', ':TablineBufferNext<cr>', {})
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() 
      require('lualine').setup {
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { require'tabline'.tabline_buffers },
          lualine_x = { require'tabline'.tabline_tabs },
          lualine_y = {},
          lualine_z = {},
        }
      }
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            }
          }
        }
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader><Space>', builtin.find_files, { desc = 'Find file' })
      vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>o', builtin.lsp_document_symbols, { desc = 'Find symbol' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find buffer' })
    end
  }
  use { 
    'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    config = function()
      require('github-theme').setup {
        theme_style = 'light',
        sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},
      } 
    end
  }
  use { 
    "folke/which-key.nvim",
    config = function() 
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {}
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup {}
      vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>', { desc = 'Open directory' })
    end
  }
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {}
    end
  }
  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup {}
    end
  }
  use {
    'f-person/auto-dark-mode.nvim',
    config = function()
      local auto_dark_mode = require('auto-dark-mode')
      auto_dark_mode.setup({
          update_interval = 1000,
          set_dark_mode = function()
              vim.api.nvim_set_option('background', 'dark')
              vim.cmd('colorscheme github_dark')
          end,
          set_light_mode = function()
              vim.api.nvim_set_option('background', 'light')
              vim.cmd('colorscheme github_light')
          end,
      })
      auto_dark_mode.init()
    end
  }
  use {
    'akinsho/toggleterm.nvim', tag = '*', 
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]], -- We don't use this
      }

      vim.keymap.set('n', '<Leader>s', ':ToggleTerm<cr>', { desc = 'Toggle terminal' })
    end
  }

  -- Language specific
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      local rt = require('rust-tools')
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
      rt.inlay_hints.enable()
    end
  }
  use {
    'ray-x/go.nvim',
    requires = {{'neovim/nvim-lspconfig'}, {'nvim-treesitter/nvim-treesitter'}},
    config = function()
      require("go").setup()

      -- vim.cmd [[autocmd BufWritePre (InsertLeave?) <buffer> go vim.lsp.buf.formatting_sync(nil, 500)]]
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
    end
  }
end)

-- Configure mason
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'astro' },
}

-- Configure cmp
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

require'lspconfig'.gopls.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
