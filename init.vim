" Behavior
set clipboard=unnamed                " Use macOS clipboard
set ai                               " Automatic indent
set splitright                       " Open panels on the right side
setlocal spell spelllang=en_gb       " Spell check
set whichwrap+=<,>,h,l,[,]           " Allow cursor keys to wrap at begining/eol
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

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
