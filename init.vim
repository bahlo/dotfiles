" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-startify'
" Plug 'dracula/vim'                                                    " Color scheme
" Plug 'rakr/vim-one'                                                   " Color scheme
Plug 'chriskempson/base16-vim'                                          " For oceanic-next
Plug 'vim-airline/vim-airline'                                          " Airline
Plug 'vim-airline/vim-airline-themes'                                   " Airline themes
Plug 'mhinz/vim-signify'                                                " Show git status indicator
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }                            " CtrlP - Fuzzy file finder
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion-prefix)' } " Vim motions on speed
Plug 'tpope/vim-fugitive'                                               " Git wrapper
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }           " Easily align multiple lines
Plug 'tpope/vim-commentary'                                             " Comment stuff out
Plug 'tpope/vim-surround'                                               " Quoting/Parenthesizing made simple
Plug 'tweekmonster/startuptime.vim'                                     " Get startuptime for plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }              " File explorer
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }          " Open via multiple tabs
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }                      " Display tags in a sidebar
Plug 'terryma/vim-multiple-cursors'                                     " Multiple cursor support
Plug 'tpope/vim-vinegar'                                                " Easy, fast directory browsing
Plug 'mileszs/ack.vim', { 'on': 'Ack' }                                 " Run your favorite search tool from Vim

Plug 'mxw/vim-jsx', { 'for': 'javascript' }                   " JSX syntax highlighting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion system
Plug 'zchee/deoplete-go'                                      " deoplete.nvim source for Go
Plug 'othree/html5.vim'                                       " HTML5
Plug 'Shougo/neosnippet.vim'                                  " Neocomplcache snippets source
Plug 'Shougo/neosnippet-snippets'                             " Standard snippets repo
Plug 'fatih/vim-go', { 'for': 'go' }                          " Go development plugin for vim
Plug 'StanAngeloff/php.vim', { 'for': 'php' }                 " PHP syntax
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }    " Syntax checking
Plug 'mhinz/vim-grepper'                                      " Silver searcher wrapper
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }       " JavaScript syntax highlighting
Plug 'ervandew/supertab'                                      " Insert mode completion with tab
call plug#end()

" Leader
let mapleader = ","

" Behavior
set clipboard=unnamed                " Use macOS clipboard
set ai                               " Automatic indent
set splitright                       " Open panels on the right side
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
colorscheme base16-oceanicnext

" Operator Mono
highlight Comment cterm=italic
highlight Comment gui=italic
highlight htmlArg cterm=italic
highlight htmlArg gui=italic
highlight vimLineComment gui=italic
highlight vimLineComment cterm=italic

" Auto commands, general shortcuts
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace on save
" Close vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Clear search results on <leader>/
nnoremap <silent> <leader>/ :nohlsearch<CR>
" Open NERDTree on F5
nnoremap          <F5>      :NERDTreeTabsToggle<CR>
" Open Tagbar on F6
nnoremap          <F6>      :TagbarToggle<CR>
" Rebind c-p to allow lazy loading
nnoremap          <c-p>     :CtrlP<CR>
" Rebind easy-motion shortcut to allow lazy loading
map <Leader><Leader> <Plug>(easymotion-prefix)
nnoremap gca :!git add --all . && git commit -v<CR>

" Airline
let g:airline_theme='simple'               " Set Airline theme
let g:airline#extensions#branch#enabled=1  " Show git branch on Airline
let g:airline#extensions#hunks#enabled=1   " Show VCS changes
let g:airline#extensions#tabline#enabled=1 " Highligh tabs as well

" Disabled since it produces errors when Tagbar/Syntastic are not available
" at start
let g:airline#extensions#syntastic#enabled=0 " Add Syntastic support to airline
let g:airline#extensions#tagbar#enabled=0    " Add Tagbar support to airline

" CtrlP
let g:ctrlp_working_path_mode='ra'                                                " Tell CtrlP to use the next VCS path
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore everything in .gitignore

" Startify
let g:startify_list_order=['dir', 'bookmarks']
let g:startify_bookmarks=[ {'v': '~/.config/nvim/init.vim'}, {'l': '~/.localrc'}, {'z': '~/.zshrc'} ]

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Go
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command='goimports'
let g:go_list_type="quickfix"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Syntastic
let g:syntastic_loc_list_height=3
" let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=0 " It's sooo slow otherwise
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Language specific
let g:syntastic_go_checkers=['gometalinter']
let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_javascript_checkers=['eslint']

" Try local eslint if exists
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

" JavaScript
let g:javascript_plugin_jsdoc=1

" Mappings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Open Go docs vertically on gd
au FileType go nmap <leader>dv <Plug>(go-def-vertical)

" Helepr function to check syntax highlighting class
" Thanks progo: https://stackoverflow.com/a/7893500
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
      return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
