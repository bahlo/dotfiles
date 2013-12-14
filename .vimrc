set nocompatible " Use Vim defaults (much better!)
syntax enable " Enable syntax highlighting
set encoding=utf-8
set showcmd " Display incomplete commands
filetype plugin indent on " Load file type plugins + indention

"" Whitespace
set nowrap " Don't wrap lines
set tabstop=2 shiftwidth=2 " A tab is 2 spaces
set expandtab " Use spaces,not tabs
set backspace=indent,eol,start " Backspace through everything in insert mode

"" Searching
set hlsearch " Highlight matches
set incsearch " Incremental searching
set ignorecase " Search case insensitive
set smartcase " ..unless they contain at least one capital letter

"" Files
set autoread " Reload files when changed on disk

"" Editor
set backspace=2 " Fix broken backspace in some setups
set list " Show trailing whitespace
set listchars=tab:▸\ ,trail:▫

"" Wildmenu
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full
