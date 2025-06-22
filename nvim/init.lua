-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colorscheme
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
       vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  -- automatic dark mode
  -- requires: brew install cormacrelf/tap/dark-notify
  { 
    "cormacrelf/dark-notify",
    config = function ()
      require("dark_notify").run()
    end,
  },

  -- directory explorer
  {
    'stevearc/oil.nvim',
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },

  -- file finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    lazy = false, 
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        highlight = { 
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v",
            node_incremental = "<space>",
            node_decremental = "<bs>",
            scope_incremental = "<tab>",
          },
        },
        autopairs = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ["iB"] = "@block.inner",
              ["aB"] = "@block.outer",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']]'] = '@function.outer',
            },
            goto_next_end = {
              [']['] = '@function.outer',
            },
            goto_previous_start = {
              ['[['] = '@function.outer',
            },
            goto_previous_end = {
              ['[]'] = '@function.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>sn'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>sp'] = '@parameter.inner',
            },
          },
        },
      }
    end
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    dependencies = {
      "zhaozg/vim-diagram",
      "aklt/plantuml-syntax",
    },
    cmd = { "MarkdownPreview" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- comment with gc
  { 'numToStr/Comment.nvim' },

  -- split with gS and join with gJ
  { "AndrewRadev/splitjoin.vim" },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    config = function() 
      require("nvim-autopairs").setup {
        check_ts = true,
      }
    end
  },

  -- lsp
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        gopls = {
          capabilities = capabilities,
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'gofumpt', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" }})
    end
  },

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "lukas-reineke/cmp-under-comparator",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      -- local lspkind = require("lspkind")
      -- local types = require("cmp.types")
      -- local compare = require("cmp.config.compare")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      luasnip.config.setup {}

      require('cmp').setup {
        preselect = false,
        completion = {
            completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = "luasnip", keyword_length = 2},
          { name = "buffer", keyword_length = 5},
        },
        performance = {
          max_view_entries = 20,
        },
      }
    end
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end
  },
})

-- use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- backup files
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/backup")
vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.wildignore = "*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*.ali"
vim.opt.hidden = true -- can change buffers without saving

-- history and stuff
vim.opt.shada = "!,'1000,<100,s100,h,f1"
vim.opt.shadafile = vim.fn.expand("~/.config/nvim/.shada")

-- prevent <leader> from timing out
vim.opt.timeout = false
vim.opt.ttimeout = false

-- text display
vim.opt.list = false                 -- show invisible chars?
vim.opt.listchars = "tab:>-,trail:-" -- show tabs and trailing spaces
vim.opt.foldenable = false           -- disable folding at startup

-- text formatting
vim.opt.expandtab = true  -- no real tabs please!
vim.opt.shiftround = true -- when at 3 spaces, and I hit > ... go to 4, not 5
vim.opt.shiftwidth = 2    -- auto indent amount when using indents ex >> and <<
vim.opt.softtabstop = 2   -- when hitting tab or backspace, how wide should a tab be
vim.opt.tabstop = 2       -- tabs width
vim.opt.autoindent = true -- keep indenting after newline
vim.opt.smarttab = true   -- insert tabs on the start according to shiftwidth, not tabstop

-- ui
vim.opt.relativenumber = true            -- display relative line numbers
vim.opt.linespace = 0                    -- don't insert any extra pixel lines between rows
vim.opt.report = 0                       -- tell us when anything is changed via :...
vim.opt.ruler = true                     -- always show current positions along the bottom
vim.opt.showcmd = true                   -- show the command being typed
vim.opt.signcolumn = "yes"               -- Use a gutter for git-gutter and LSP messages
vim.opt.completeopt = "menuone,noselect" -- Required settings for nvim-cmp
vim.opt.conceallevel = 2                 -- Hide "concealed" syntax, for example in Djot and markdown
vim.opt.laststatus = 2                   -- always show the status line
vim.opt.colorcolumn = "80"               -- Show a column at 80 characters

-- copy current filepath to system clipboard (relative to git root, fallback to absolute path)
vim.keymap.set('n', '<Leader>e', function()
  local git_prefix = vim.fn.system('git rev-parse --show-prefix'):gsub('\n', '')
  if vim.v.shell_error == 0 then
    local relative_path = git_prefix .. vim.fn.expand('%')
    vim.fn.setreg('+', relative_path)
  else
    vim.fn.setreg('+', vim.fn.expand('%:p'))
  end
end, { silent = true })

-- open directory with - (like vim-vinegar)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- find files
vim.keymap.set("n", "<leader><space>", function()
  require('telescope.builtin').find_files()
end, { silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>f", function()
  require('telescope.builtin').live_grep()
end, { silent = true, desc = "Live grep" })

-- clear search
vim.keymap.set("n", "<leader>,", ":noh<CR>", { desc = "Clear search highlight" })

-- navigate buffers
vim.keymap.set("n", "<C-h>", ":bp<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<C-l>", ":bn<CR>", { desc = "Go to next buffer" })

