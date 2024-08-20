-- Stolen almost 1:1 from
-- https://github.com/treeman/dotfiles/blob/d243e0777fe4daa773584af2c8c00bab4714ba1f/.config/nvim/lua/config/options.lua

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Backup files
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/backup")
vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.wildignore = "*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*.ali"
vim.opt.hidden = true -- can change buffers without saving

-- History and stuff
vim.opt.shada = "!,'1000,<100,s100,h,f1"
vim.opt.shadafile = vim.fn.expand("~/.config/nvim/.shada")

-- Prevent <leader> from timing out
vim.opt.timeout = false
vim.opt.ttimeout = false

-- Text display
vim.opt.list = false                 -- show invisible chars?
vim.opt.listchars = "tab:>-,trail:-" -- show tabs and trailing spaces
vim.opt.foldenable = false           -- disable folding at startup

-- Text formatting
vim.opt.expandtab = true  -- no real tabs please!
vim.opt.shiftround = true -- when at 3 spaces, and I hit > ... go to 4, not 5
vim.opt.shiftwidth = 2    -- auto indent amount when using indents ex >> and <<
vim.opt.softtabstop = 2   -- when hitting tab or backspace, how wide should a tab be
vim.opt.tabstop = 2       -- tabs width
vim.opt.autoindent = true -- keep indenting after newline
vim.opt.smarttab = true   -- insert tabs on the start according to shiftwidth, not tabstop

-- UI
vim.opt.relativenumber = true            -- display relative line numbers
vim.opt.number = true                    -- show line numbers
vim.opt.linespace = 0                    -- don't insert any extra pixel lines between rows
vim.opt.report = 0                       -- tell us when anything is changed via :...
vim.opt.shortmess = "aOstTc"             -- shortens messages to aviod 'press a key' prompt
vim.opt.ruler = true                     -- always show current positions along the bottom
vim.opt.showcmd = true                   -- show the command being typed
vim.opt.signcolumn = "yes"               -- Use a gutter for git-gutter and LSP messages
vim.opt.completeopt = "menuone,noselect" -- Required settings for nvim-cmp
vim.opt.conceallevel = 2                 -- Hide "concealed" syntax, for example in Djot and markdown
vim.opt.laststatus = 2                   -- always show the status line
vim.opt.colorcolumn = "80"               -- Show a column at 80 characters
