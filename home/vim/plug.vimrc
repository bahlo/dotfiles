call plug#begin('~/.vim/plugged')

" Visual plugins
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree',            { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar' ",            { 'on': 'TagbarToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim',                 { 'on': 'CtrlP' }
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
Plug 'tpope/vim-obsession'

" Snippets
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Language syntax highlighting
Plug 'groenewege/vim-less',              { 'for': 'less'  }
Plug 'kchmck/vim-coffee-script',         { 'for': 'coffee'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'othree/yajs.vim',                  { 'for': 'javascript' }
Plug 'cespare/vim-toml',                 { 'for': 'toml'}
Plug 'evanmiller/nginx-vim-syntax'
Plug 'apple/swift',                      { 'rtp': 'utils/vim', 'for': 'swift' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'rust-lang/rust.vim'

" Language extensions
Plug 'fatih/vim-go',                  { 'for': 'go' }
Plug 'othree/html5.vim',              { 'for': 'html' }

" Themes
"Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'primedirective/Glacier-Remixes', { 'rtp': 'vim' }
"Plug 'w0ng/vim-hybrid'
"Plug 'trusktr/seti.vim'
"Plug 'zenorocha/dracula-theme',        { 'rtp': 'vim' }
"Plug 'reedes/vim-colors-pencil'
"Plug 'joshdick/onedark.vim'
"Plug 'joshdick/airline-onedark.vim'
"Plug 'tomasr/molokai'

" Addons
Plug 'ryanss/vim-hackernews', { 'on': 'HackerNews' }
"Plug 'mhinz/vim-startify'

call plug#end()
