call plug#begin('~/.vim/plugged')
" Install fzf and fzf.vim for fuzzy searching (mapped to <C-P>)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" gS to split one-liner, gJ to join
Plug 'AndrewRadev/splitjoin.vim'
" Automatically :set paste
Plug 'ConradIrwin/vim-bracketed-paste'
" Automatically add closing quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" Provides a lot of IDE-like features for working with Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" :Rg <string|pattern> to search with ripgrep
Plug 'jremmen/vim-ripgrep'
" Run gcc/gc to comment out or in
Plug 'tpope/vim-commentary'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Remap . so plugins can tap into it
Plug 'tpope/vim-repeat'
" Surround blocks (e.g. ysiw] to surround inner word with [])
Plug 'tpope/vim-surround'
" Make <C-A>/<C-X> work on dates
Plug 'tpope/vim-speeddating'
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'
" Multiple cursors <C-N>
Plug 'terryma/vim-multiple-cursors'
" Add unix commands (like :Delete, :Move, etc.) 
Plug 'tpope/vim-eunuch'
" Collection of language packlanguage packs
Plug 'sheerun/vim-polyglot'
" Display git diff information in gutter
Plug 'airblade/vim-gitgutter'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Statusline
Plug 'itchyny/lightline.vim'
" Add ALE to lightline
Plug 'maximbaz/lightline-ale'
" One dark color scheem
Plug 'joshdick/onedark.vim'
" Align text
Plug 'godlygeek/tabular'
" File browser
Plug 'scrooloose/nerdtree'
" Outline viewer
Plug 'majutsushi/tagbar'
" Autocompletion (deoplete)
" NOTE: This needs the following packages
" go get -u github.com/mdempsky/gocode
" pip3 install pynvim
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()

" Colorscheme configuration
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme onedark

set nocompatible           " Disable compatibility mode

filetype off
filetype plugin indent on

set laststatus=2                " Always show status bar
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     " Enable mouse mode

set noerrorbells             " No beeps
set number relativenumber    " Show hybrid line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set lazyredraw
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set colorcolumn=80

" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" Filetypes
augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead justfile setf make
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
  
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.js setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.yml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.yml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.yaml setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR> 

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

" Act like D and C
nnoremap Y y$

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $

" Do not show stupid q: window
map q: :q

" Create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

" Editorconfig configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Make sure it works with vim-fugitive

" fzf configuration
map <C-P> :Files<CR>

" vim-go configuration
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_format_strings = 1

" delimitMate configuration
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" lightline configuration
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileformat', 'fileencoding', 'filetype' ],
  \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
\ }

" NERDTree configuration
noremap <F5> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tagbar
nmap <F6> :TagbarToggle<CR>
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" deoplete
let g:deoplete#enable_at_startup = 1

" vim: sw=2 sw=2 et
