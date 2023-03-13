" Disbale vi-compatibility
set nocompatible

" Search
set showmatch
set ignorecase
set hlsearch
set incsearch

" Tabs, spaces and indentation
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=2
set autoindent
filetype plugin indent on

" Line numbers, cursor line, column border
set number
set relativenumber
set cursorline
set cc=80

" Everything else
let mapleader = "\<Space>"
syntax on
set wildmode=longest,list
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set ttyfast
set noswapfile
