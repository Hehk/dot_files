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
Plug 'joshdick/onedark.vim'
Plug 'logico-dev/typewriter'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeIgnore = ['\.swo$', '\.swp$']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "d",
    \ "Dirty"     : "x",
    \ "Clean"     : "c✔︎",
    \ 'Ignored'   : 'i',
    \ "Unknown"   : "?"
    \ }
let NERDTreeShowHidden=1
:map <leader>\ :NERDTreeToggle<CR>
" Close vim if I quit and the only open window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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
  \ },
  \ }

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
  \ 'json': ['prettier'],
  \ 'typescript': ['prettier']
  \ }
let g:ale_liners = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ 'reason': ['merlin']
  \ }
nmap <leader>l <Plug>(ale_fix)
let g:airline#extensions#ale#enabled = 1

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Complete
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 let g:deoplete#enable_at_startup = 1

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {}
let g:LanguageClient_autoStart = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gi :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gn :call LanguageClient_textDocument_rename()<cr>

" Elixir
Plug 'elixir-lang/vim-elixir'

" CSS
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = []

" JavaScript
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allows jsx reading in js files
let g:LanguageClient_serverCommands['javascript'] = ['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['javascript.jsx'] = ['tcp://127.0.0.1:2089']

" OCaml
Plug 'reasonml-editor/vim-reason-plus'
let g:LanguageClient_serverCommands['reason'] = ['ocaml-language-server', '--stdio']
let g:LanguageClient_serverCommands['ocaml'] = ['ocaml-language-server', '--stdio']

" Docker
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'

" TypeScript
Plug 'https://github.com/leafgarland/typescript-vim.git'
let g:LanguageClient_serverCommands['typescript'] = ['javascript-typescript-stdio']

" Idris
Plug 'https://github.com/idris-hackers/idris-vim.git'

" Python
let g:LanguageClient_serverCommands['python'] = ['pyls']

call plug#end()

" STYLING {{{
  " This need to be called after the plug install
  colorscheme onedark

  " Vert Seperator
  set fillchars+=vert:│
  hi clear VertSplit

  " Getting rid of clutter
  hi EndOfBuffer ctermfg=235
  hi clear ColorColumn
" }}}
