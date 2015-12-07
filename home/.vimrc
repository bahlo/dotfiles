" Use Vim defaults
set nocompatible

" Enable syntax highlighting
syntax enable

" Set up plug
source ~/dotfiles/home/vim/plug.vimrc

" Ensure ftdetect is working
filetype plugin indent on

" Theme
set background=dark
"let base16colorspace=256
colorscheme jellybeans

" Startify
let g:startify_bookmarks = [ '~/.vimrc', '~/.vimrc.plug' ]
let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" General configuration
set autoread                   " Reload files on change
set autoindent
set backspace=indent,eol,start " Backspace through everything in insert mode
set backupcopy=yes
set clipboard=unnamed
set colorcolumn=79
set encoding=utf-8
set expandtab                  " Expand tabs to spaces
set ffs=unix                   " Default to LF
set hlsearch                   " Highlight search results
set smartcase                  " Search is case sensitive if any caps
set incsearch                  " Seach as you type
set laststatus=2               " Always show statusline
set list                       " Show trailing whitespace
set listchars=tab:▸\ ,trail:▫
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

" Shortcuts
let mapleader = ","
nnoremap          <F5>      :NERDTreeTabsToggle<CR>
nnoremap          <F6>      :TagbarToggle<CR>
nnoremap          <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap          <c-t>     :CtrlP<CR>

" CTRL-P
let g:ctrlp_custom_ignore='node_modules\|bower_components\|vendor\|tags\|_workspace\|target'

" Airline
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled     = 0

" YCM
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" EasyAlign (vip<Enter>= or gaip=)
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Make shortcuts
nmap <leader>m  :!make<CR>
nmap <leader>mr :!make run<CR>
nmap <leader>mc :!make clean<CR>

" Git shortcuts
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gd :Gdiff<CR>

" Go shortcuts
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd        <Plug>(go-def)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Highlight go stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Clear background of Gitgutter
hi clear SignColumn

" Tagbar
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
