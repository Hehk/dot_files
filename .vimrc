" Section: General Config
" -----------------------
let mapleader = " "
syntax on

set number	
set linebreak
set showbreak=+++
set showmatch	
set visualbell
 
" setting the grey section after 80 characters
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=8

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

" Line number 
set number
set numberwidth=6

call plug#begin('~/dot_files/.vim/plugged')

" Section: Generic Plugins
" ------------------------

" Git integration
Plug 'https://github.com/tpope/vim-pathogen.git'
Plug 'airblade/vim-gitgutter'

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

" Distraction free typing
Plug 'junegunn/goyo.vim'
let g:goyo_width = 100


" Section: LANGUAGES PLUGINS
" --------------------------

" General linting engine
Plug 'w0rp/ale'
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '~>'
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
nmap <leader>l <Plug>(ale_fix)

" Elixir
Plug 'elixir-lang/vim-elixir'

" JavaScript
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allows jsx reading in js files

call plug#end()

