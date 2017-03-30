"" General vim options
syntax enable
filetype plugin indent on
set nocompatible
set autoread
set autoindent
set backspace=indent,eol,start
set backupcopy=yes
set clipboard=unnamed
set colorcolumn=79
set encoding=utf-8
set expandtab
set ffs=unix
set hlsearch
set smartcase
set incsearch
set laststatus=2
set list
set listchars=tab:▹\ ,trail:▫,nbsp:⋅
set ruler
set scrolloff=3
set shiftwidth=2
set showbreak=↪
set showcmd
set softtabstop=2
set tabstop=4
set textwidth=79
set ttyfast
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full
set wrap
set relativenumber
set cursorline
set noswapfile
set formatoptions-=o           " Dont continue comments when pushing o/O
set hidden

call plug#begin('~/.vim/plugged')

" Visual plugins
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree',            { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar' ",            { 'on': 'TagbarToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim',             { 'on': 'CtrlP' }
Plug 'sjl/gundo.vim',                  { 'on': 'GundoToggle' }
Plug 'tpope/vim-vinegar'
Plug 'edkolev/tmuxline.vim'

" Special functionality
Plug 'junegunn/vim-easy-align' ",     { 'on': 'EasyAlign' }
Plug 'lokaltog/vim-easymotion'
Plug 'rking/ag.vim',                  { 'on': 'Ag' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-dispatch'
Plug 'AndrewRadev/splitjoin.vim'

" Snippets
Plug 'valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --racer-completer'}
Plug 'racer-rust/vim-racer'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Language syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go',               { 'for': 'go' }
Plug 'posva/vim-vue',              { 'for': 'vue' }
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
Plug 'rust-lang/rust.vim'

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
"Plug 'mhartington/oceanic-next'
"Plug 'nanotech/jellybeans.vim'
"Plug 'chriskempson/base16-vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'primedirective/Glacier-Remixes', { 'rtp': 'vim' }
"Plug 'dracula/vim'

" Addons
Plug 'mhinz/vim-startify'

call plug#end()

" Theme
" NOTE: We do a try/catch to permit usage without plugins installed
set background=dark
try
  colorscheme onedark
catch
endtry

" Shortcuts and everything that can be configured without plugins
let mapleader = ","
nnoremap          <F5>      :NERDTreeTabsToggle<CR>
nnoremap          <F6>      :TagbarToggle<CR>
nnoremap          <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap          <c-p>     :CtrlP<CR>

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

" Only show what you must
let g:NERDTreeMinimalUI=1

" CTRL-P
let g:ctrlp_custom_ignore='node_modules\|bower_components\|vendor\|tags\|_workspace\|target'

" Airline
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled     = 0
let g:airline_theme                        = 'onedark'
let g:tmuxline_preset = {
    \'a'       : '#S',
    \'win'     : ['#I', '#W'],
    \'cwin'     : ['#I', '#W'],
    \'x'       : '#{prefix_highlight}',
    \'y'       : '%Y-%m-%d %R',
    \'z'       : '#H',
    \'options' : {'status-justify' : 'left'}}

" EasyAlign (vip<Enter>=)
vmap <Enter> <Plug>(EasyAlign)

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntax
hi clear SignColumn " Clear background of Gitgutter

" Re-open last file
nnoremap <Leader>. :e#<CR>
nnoremap <Leader>p :source ~/.vimrc<CR> :PlugInstall<CR> :q<CR>

" YCM
nnoremap <Leader>] :YcmCompleter GoTo<CR>
let g:ycm_rust_src_path = '$HOME/rust/src'

" Startify
let g:startify_list_order = ['dir', 'bookmarks', 'sessions']
let g:startify_bookmarks = [
  \ {'v': '~/.vimrc'},
  \ {'z': '~/.zshrc' },
  \ {'l': '~/.localrc'}
\]
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 0
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header =
  \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:syntastic_go_checkers = ['gometalinter', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']

" Rust
let g:rustfmt_autosave = 0
let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits,traits',
      \'i:impls,trait implementations',
  \]
  \}
