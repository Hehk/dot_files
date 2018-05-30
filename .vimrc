let mapleader = " "
let maplocalleader = "  "
syntax on

set number	
set linebreak
set showbreak=+++
set showmatch	
set visualbell
 
" setting the grey section after 80 characters
set textwidth=120
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
set numberwidth=5

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Italic Comments
" https://sookocheff.com/post/vim/italics/
highlight Comment cterm=italic

" Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Moving lines
" I need to use the characters Alt-<Key> makes in mac instead of A-<key>
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim/15399297#15399297
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <ESC>:m .+1<CR>==gi
inoremap ˚ <ESC>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

call plug#begin('~/dot_files/.vim/plugged')

" Section: Generic Plugins
" ------------------------

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'
let NERDTreeShowHidden=1
:map <leader>\ :NERDTreeToggle<CR>

" Fuzzy Search
Plug 'https://github.com/kien/ctrlp.vim.git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" Bottom Bar
Plug 'itchyny/lightline.vim'
set laststatus=2

" Better Relative Line Number
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Comment lines out
Plug 'tpope/vim-commentary'

" Tab Completion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" Section: LANGUAGES PLUGINS
" --------------------------

" General linting engine
Plug 'w0rp/ale'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '>'
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier']
  \ }
let g:ale_liners = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ 'reason': ['merlin']
  \ }
nmap <leader>l <Plug>(ale_fix)
let g:airline#extensions#ale#enabled = 1

" Elixir
Plug 'elixir-lang/vim-elixir'

" CSS
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" JavaScript
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'styled-components/vim-styled-components'
let g:jsx_ext_required = 0 " Allows jsx reading in js files
syntax region jsTemplateString start=+[a-zA-Z)]`+ skip=+\\\(`\|$\)+ end=+`+

" Reason
Plug 'reasonml-editor/vim-reason'
let g:vimreason_extra_args_expr_reason = '"--print-width " . ' .  "min([120, winwidth('.')])"
autocmd FileType reason map <leader>l :ReasonPrettyPrint<Cr>
" Adding Merlin to the vim runtime
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Docker
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'

" TypeScript
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'https://github.com/Quramy/tsuquyomi.git'

" Idris
Plug 'https://github.com/idris-hackers/idris-vim.git'

call plug#end()
