" File: `~/.config/nvim/init.vim`
filetype off

" Required for Python on MacOS
"
" brew install python
" brew install python3
" pip2 install neovim --upgrade
" pip3 install neovim --upgrade
"
" brew install neovim

" SECTION DEIN --- {{{
" https://github.com/Shougo/dein.vim
" Installed to ~/.config/nvim/bundle

if &compatible
  set nocompatible " Be iMproved
endif

let dein_path = $HOME . '/.config/nvim'
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(dein_path)
  call dein#begin(dein_path)

  " Let dein manage dein
  " Required:
  call dein#add(dein_path)

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')            " NERD Tree file browser
  call dein#add('Xuyuanp/nerdtree-git-plugin')    " Git support in NERD Tree
  call dein#add('vim-airline/vim-airline')        " Status bar
  call dein#add('vim-airline/vim-airline-themes') " Status bar themes
  call dein#add('tpope/vim-surround')             " Vim bracket/parentheses wrapping
  call dein#add('cloudhead/neovim-fuzzy')         " Fuzzy search with fzy
  call dein#add('jremmen/vim-ripgrep')            " search with :Rg
  call dein#add('tpope/vim-fugitive')             " Git stuff
  call dein#add('airblade/vim-gitgutter')         " Git annotations
  call dein#add('Valloric/MatchTagAlways')        " HTML tag highlight and jumping
  call dein#add('maralla/completor.vim')          " Auto complete
  call dein#add('w0rp/ale')                       " Asynchronous Lint Engine
  call dein#add('sheerun/vim-polyglot')
  call dein#add('luochen1990/rainbow')

  " Syntax support
  "call dein#add('rust-lang/rust.vim')
  "call dein#add('jelera/vim-javascript-syntax')
  "call dein#add('vim-python/python-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('maxmellon/vim-jsx-pretty')
  "call dein#add('nikvdp/ejs-syntax')
  "call dein#add('keith/rspec.vim')

  " colorschemes
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('morhetz/gruvbox')                " gruvbox theme

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Automatically install new plugins
if dein#check_install()
  call dein#install()
endif

" }}}

" Required:
filetype plugin indent on
syntax enable

" Color Scheme settings --- {{{
"color gruvbox
color nord
set background=dark

" }}}

" Basic settings --- {{{
set mouse=a
set incsearch hlsearch
set ignorecase smartcase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

set nowrap

set number
set relativenumber
set numberwidth=2

" Set Clipboard --- {{{
if has('unnamedplus')
  set clipboard=unnamedplus
endif
" }}}

" Set autocomplete --- {{{
let g:completor_node_binary = '~/.nvm/versions/node/v8.9.1/bin/node'
" }}}

" Set rainbow --- {{{
let g:rainbow_active = 1
" }

let mapleader = "\\"
let localmapleader = ","

" Setting up vim-airline powerline
let g:airline_powerline_fonts = 1
set laststatus=2
set guifont=Hack

let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'eruby' : 1, 'javascript.jsx' : 1 }
let g:jsx_ext_required = 0

" ALE Config --- {{{
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_completion_enabled = 1 " Type all the damn scripts
" }}}

" Nord config
let g:nord_comment_brightness = 20

" }}}

" Mappings --- {{{

" autocomplete mapping --- {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" }}}

" Fuzzy Finder with fzy --- {{{
nnoremap <C-p> :FuzzyOpen<CR>
" TODO: find another replacement for FuzzyGrep binding
" nnoremap <C-s> :FuzzyGrep<CR>
" }}}

" Ripgrep search --- {{{
nnoremap <C-s> :Rg<space>
" }

" Toggles NERDTree
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-e> :NERDTreeFind<CR>

" ALE Mapping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Exit from insert mode
inoremap jk <esc>

" Allow moving up and down even when word is wrapped
nnoremap j gj
nnoremap k gk

" Move to start or end of line with H and L
nnoremap H 0
nnoremap L $

" Move entire line down with - and up with _
nnoremap _ ddkkp
nnoremap - ddp

" Make current word uppercase
inoremap <leader><c-u> <esc>evbUea
nnoremap <leader><c-u> evbUel

" Edit .vimrc and source
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Cover word with quotation marks in normal mode and visual mode
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" Deleting stuff in/around next/last paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(bvg_<cr>
onoremap al( :<c-u>normal! F)%bvg_<cr>
" Deleting stuff in/around next/last curly bracket
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{bvg_<cr>
onoremap al{ :<c-u>normal! F}%bvg_<cr>
" Deleting stuff in/around next/last square bracket
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap an[ :<c-u>normal! f[bvg_<cr>
onoremap al[ :<c-u>normal! F]%bvg_<cr>

" Autocomplete curly bracket
inoremap {<cr> {<cr>}<Esc>O

" Default search to use 'very magic'
nnoremap / /\v

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader><space> :setlocal nohlsearch!<cr>

" new tab
nnoremap <C-t> :tabe<cr>
" }}}

set autoread " trigger filetype checking
