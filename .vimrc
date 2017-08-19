syntax on

set number	
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell
 
set hlsearch
set smartcase
set ignorecase	
set incsearch	
 
set autoindent
set expandtab	
set shiftwidth=2	
set smartindent	
set smarttab	
set softtabstop=2	
 
set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start	

" --- --- --- --- --- --- --- --- --- --- --- --- --- ---
" PLUGINS!!!!!!!!!
" plug - https://github.com/junegunn/vim-plug
" --- --- --- --- --- --- --- --- --- --- --- --- --- ---
call plug#begin('~/dot_files/.vim/plugged')

" Git integration
Plug 'https://github.com/tpope/vim-pathogen.git'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'
let NERDTreeShowHidden=1
:map <C-\> :NERDTreeToggle<CR>

" Fuzzy Search
Plug 'https://github.com/kien/ctrlp.vim.git'

" Bottom Bar
Plug 'itchyny/lightline.vim'
set laststatus=2

" Better Relative Line Number
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Comment lines out
Plug 'tpope/vim-commentary'


call plug#end()

