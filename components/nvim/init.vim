" GENERAL CONFIG

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

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

set ruler
set undolevels=1000
set backspace=indent,eol,start

" Line number
set number
set numberwidth=5
" Folding, default to by indent
set foldmethod=indent
set foldignore=

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

" One Dark
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'logico-dev/typewriter'

" Tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'

" file tree
Plug 'https://github.com/tpope/vim-vinegar'
" let g:netrw_liststyle=3
let g:netrw_banner = 0

" Fuzzy Search
Plug 'https://github.com/kien/ctrlp.vim.git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <C-f> :Ack!<Space>

" Bottom Bar
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [], ['gitbranch', 'filename', 'modified'] ],
  \   'right': [ [], [], [ 'lineinfo' ] ],
  \ },
  \ 'inactive': {
  \   'left': [ [], ['filename'] ],
  \   'right': [ [], [], ['lineinfo'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveStatusline'
  \ }
  \ }

" Better Relative Line Number
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Comment lines out
Plug 'tpope/vim-commentary'

" Tab Completion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plug 'tpope/vim-surround'

" Section: LANGUAGES PLUGINS
" --------------------------

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'reason':     ['ocaml-language-server', '--stdio'],
  \ 'ocaml':      ['ocaml-language-server', '--stdio'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'python':     ['pyls'],
  \ 'clojure':    ['clojure-lsp']
  \ }

function! s:format()
  call LanguageClient_textDocument_formatting()
endfunction

nnoremap gm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gi :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gn :call LanguageClient_textDocument_rename()<cr>
nnoremap ga :call LanguageClient_textDocument_codeAction()<cr>

" Elixir
Plug 'elixir-lang/vim-elixir'

" Markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = []

" JavaScript
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allows jsx reading in js files

" OCaml
Plug 'reasonml-editor/vim-reason-plus'

" Docker
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'

" TypeScript
Plug 'https://github.com/leafgarland/typescript-vim.git'

" Idris
Plug 'https://github.com/idris-hackers/idris-vim.git'

" Python
let g:LanguageClient_serverCommands['python'] = ['pyls']

call plug#end()

" STYLING {{{
  set t_Co=256
  set background=dark
  colorscheme onedark

  " Vert Seperator
  hi VertSplit ctermfg=darkgray
  set fillchars=vert:\│

  " Setting the background to match the terminal
  hi Normal ctermbg=NONE
  hi NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
   
  " Getting rid of clutter
  hi EndOfBuffer ctermfg=black ctermbg=black
  hi ColorColumn ctermfg=black ctermbg=black
" }}}
