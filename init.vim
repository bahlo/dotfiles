" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ayu-theme/ayu-vim'                                      " Color scheme
Plug 'vim-airline/vim-airline'                                " Airline
Plug 'vim-airline/vim-airline-themes'                         " Airline themes
Plug 'mhinz/vim-signify'                                      " Show git status indicator
Plug 'ctrlpvim/ctrlp.vim'                                     " CtrlP - Fuzzy file finder
Plug 'easymotion/vim-easymotion'                              " Vim motions on speed
Plug 'tpope/vim-fugitive'                                     " Git wrapper
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' } " Easily align multiple lines
Plug 'tpope/vim-commentary'                                   " Comment stuff out
Plug 'tpope/vim-surround'                                     " Quoting/Parenthesizing made simple
Plug 'tweekmonster/startuptime.vim'                           " Get startuptime for plugins

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion system
Plug 'zchee/deoplete-go'                                      " deoplete.nvim source for Go
Plug 'Shougo/neosnippet.vim'                                  " Neocomplcache snippets source
Plug 'Shougo/neosnippet-snippets'                             " Standard snippets repo
Plug 'fatih/vim-go'                                           " Go development plugin for vim
Plug 'vim-syntastic/syntastic'                                " Syntax checking
call plug#end()

" Leader
let mapleader = ","

" Behavior
set clipboard=unnamed                " Use macOS clipboard
set ai                               " Automatic indent
set splitright                       " Open panels on the right side
setlocal spell spelllang=en_gb       " Spell check
set whichwrap+=<,>,h,l,[,]           " Allow cursor keys to wrap at beginning/end of line
set hidden                           " Allow hidden buffers
set list                             " Highlight whitespace
set listchars=tab:▹\ ,trail:▫,nbsp:⋅ " Which char to represent what

" Cursor
set cursorline     " Highlight cursor line
set colorcolumn=79 " Show column at char 79
set nu             " Line numbers
set relativenumber " Show relative line numbers

" Searching
set incsearch " Incremental search
set hlsearch  " Highlight search results
set ic        " Ignore case when searching

" Tabs
set ts=4         " Display tabs with 4 spaces
set shiftwidth=2 " Tab inserts 2 spaces
set expandtab    " Tab inserts spaces

" Encoding
set encoding=utf-8
set ffs=unix

" Theme
set termguicolors
set bg=dark
syntax enable
let ayucolor="mirage"
colorscheme ayu

" Auto commands
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace on save

" Airline
let g:airline_theme='simple'                 " Set Airline theme
let g:airline#extensions#branch#enabled=1    " Show git branch on Airline
let g:airline#extensions#syntastic#enabled=1 " Add Syntastic support to airline
let g:airline#extensions#hunks#enabled=1     " Show VCS changes

" CtrlP
let g:ctrlp_working_path_mode='ra'           " Tell CtrlP to use the next VCS path
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore everything in .gitignore

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_list_type = "quickfix"

" Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Mappings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Open Go docs vertically on gd
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
