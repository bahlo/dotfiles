call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'

" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Langauges
Plug 'rust-lang/rust.vim'
call plug#end()

" Color scheme
set t_Co=256
set termguicolors
set background=dark
try
	colorscheme challenger_deep
catch
endtry

" Relative line numbers
set number relativenumber

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

" Make Y act like D and C
nnoremap Y y$

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $

" Do not show stupid q: window
map q: :q

" Enable tab navigation with C-H, C-L
set hidden
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>

" Map <C-p> to fzf git-files
map <C-p> :GFiles<CR>

" Enable rainbow brackets
let g:rainbow_active = 1

" Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure NERDTree
map <F5> :NERDTreeToggle<CR>
" Close NERDTree if it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Configure tagbar
nmap <F6> :TagbarToggle<CR>

" Rust configuration
let g:rustfmt_autosave = 1 
