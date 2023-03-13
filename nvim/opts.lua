-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.keymap.set('n', '<leader>,', ':noh<return><esc>', { desc = 'Clear highlight' })
