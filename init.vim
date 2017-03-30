" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ayu-theme/ayu-vim'              " Color scheme
Plug 'vim-airline/vim-airline'        " Airline
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'mhinz/vim-signify'              " Show git status indicator
Plug 'ctrlpvim/ctrlp.vim'             " CtrlP - Fuzzy file finder
call plug#end()

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

" Configure plugins
let g:airline_theme='simple'                                                      " Set airline theme
let g:ctrlp_working_path_mode='ra'                                                " Tell CtrlP to use the next VCS path
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore everything in .gitignore
