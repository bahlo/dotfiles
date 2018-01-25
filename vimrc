set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set directory-=.
set encoding=utf8
set expandtab
set fileformats=unix,dos,mac
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
silent! set mouse=nvc
set nobackup
set visualbell t_vb=
set nowritebackup
set ruler
set shortmess+=A
set showmatch
set softtabstop=2
set textwidth=80
set clipboard=unnamed
set relativenumber
set colorcolumn=80

filetype plugin indent on

nmap j gj
nmap k gk
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

let mapleader = ","
let maplocalleader = ","

let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
set updatetime=100
