" These need to be configured before the plugin is loaded. They are disabled
" because we have special plugins for them.
let g:polyglot_disabled = ['golang', 'rust']

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'ervandew/supertab'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'chrisbra/matchit'
Plug 'mg979/vim-visual-multi'

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Fzf
Plug 'junegunn/fzf', { 'on': 'Files' }
Plug 'junegunn/fzf.vim', { 'on': 'Files' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Fugitive + addons
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'

" Themes
Plug 'chriskempson/base16-vim'

" Polygot as fallback
Plug 'sheerun/vim-polyglot'

" Languages
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
call plug#end()

" Color scheme
set termguicolors
let base16colorspace=256 " Access colors present in 256 colorspace

" Color scheme defaults to light version but is overwritten in SetAppearance
" at the end
set background=light
colorscheme base16-unikitty-light

" Relative line numbers
set number relativenumber

" Use system clipboard
set clipboard=unnamed

" Set map leader
let mapleader = ','

" EasyAlign (vip<Enter>= or gaip=)
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Make Y act like D and C
nnoremap Y y$

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $

" Do not show stupid q: window
map q: :q

" Add column
set colorcolumn=80

" Enable tab navigation with C-H, C-L
set hidden
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>

" Close all other buffers
command! BufOnly silent! execute "%bd|e#|bd#"

" fzf
map <C-p> :Files<CR>
let g:fzf_preview_window = []

" Enable rainbow brackets
let g:rainbow_active = 1

" Configure ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" \  'go': ['gofmt', 'golint', 'govet', 'gopls', 'golangci-lint'],
let g:ale_linters = {
\  'go': ['golangci-lint'],
\}

" NERDTree
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
map <F5> :NERDTreeToggle<CR>

" Fugitive
command! -bang -bar -nargs=* Gca execute 'Git<bang> add . | Git<bang> commit -v' <q-args>
command! -bang -bar -nargs=* Gco execute 'Git<bang> checkout' <q-args>
command! -bang -bar -nargs=* Gcob execute 'Git<bang> checkout -b' <q-args>
command! -bang -bar -nargs=* Gpsu execute 'Git<bang> push --set-upstream' <q-args>
command! -bang -bar -nargs=* Gri execute 'Git<bang> rebase -i' <q-args>
let g:fugitive_gitlab_domains = ['https://axicode.axiom.co']

" Tagbar
nmap <F6> :TagbarToggle<CR>

" Airline + tmuxline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:tmuxline_powerline_separators = 0

" Rust
let g:rustfmt_autosave = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Go configuration
let g:syntastic_go_checkers = ['golint', 'govet', 'golangci-lint']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
autocmd FileType go let b:go_fmt_options = {
  \ 'goimports': '-local ' .
  \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
  \ }
let g:go_auto_type_info = 1
let g:go_build_tags = 'integration,debug'

" Highlight _everything_
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" HTML
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

" JSON
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab

" Automatically switch light/dark background + theme
function! SetAppearance(...)
  try
    let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
    let s:new_bg = ""
    let s:new_theme = ""
    if s:mode ==? "Dark"
      let s:new_bg = "dark"
      let s:new_theme = "base16-unikitty-dark"
    else
      let s:new_bg = "light"
      let s:new_theme = "base16-unikitty-light"
    endif
    if &background !=? s:new_bg
      let &background = s:new_bg
      execute 'colorscheme '.s:new_theme
    endif
  catch
    " Ignore errors
  endtry
endfunction
call SetAppearance()
call timer_start(2000, "SetAppearance", {"repeat": -1})
