" enable syntax highlighting
syntax enable

set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set backspace=2 " Fix broken backspace in some setups
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab " expand tabs to spaces
set ignorecase " case-insensitive search
set incsearch " search as you type
set laststatus=2 " always show statusline
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number " show line numbers
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set showcmd
set smartcase " case-sensitive search if any caps
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=8 " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full
