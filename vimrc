" Vundle settings ----------------------------- {{{
set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Bundles available on github --- {{{
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'zeis/vim-kolor'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-session'
Bundle 'wakatime/vim-wakatime'
Bundle 'rust-lang/rust.vim'
Bundle 'KabbAmine/zeavim.vim'
Bundle 'vitalk/vim-simple-todo'
" }}}

" Plugins from vimawesome.com --- {{{
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'renamer.vim'
" }}}

" Bundles on http://vim-scripts.org/vim/scripts.html --- {{{
Bundle 'L9'
Bundle 'FuzzyFinder'
" }}}

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" }}}

" Color Scheme settings --- {{{
"  option name default optional
"  g:solarized_termcolors= 16 | 256
"  g:solarized_termtrans = 0 | 1
"  g:solarized_degrade = 0 | 1
"  g:solarized_bold = 1 | 0
"  g:solarized_underline = 1 | 0
"  g:solarized_italic = 1 | 0
"  g:solarized_contrast = “normal”| “high” or “low”
"  g:solarized_visibility= “normal”| “high” or “low”

let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized

" }}}

" Basic settings --- {{{
set incsearch hlsearch
set ignorecase smartcase

set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab

set nowrap

set number
set relativenumber
set numberwidth=2

set t_Co=256

let mapleader = ","
let localmapleader = "\\"

" Setting up vim-airline powerline
let g:airline_powerline_fonts = 1
set laststatus=2

" Sets NERDTree to open by default
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Set Ack to use Silver Searcher (Ag)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Easytags setup {{{
" Set Easytags to save to tags per project basis
set tags=./tags;
" update the project tags, else update global tags
let g:easytags_dynamic_files=1
""Run Easytags async
let g:easytags_async=1
let g:easytags_by_filetype= '~/.vim/tags/'
autocmd FileType *.js,*.py,*.rb,*.php BufWritePost UpdateTags
" }}}

" vim-session settings {{{
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 5
" }}}
" }}}

" Mappings --- {{{

" Toggles NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Exit from insert mode
inoremap jk <esc>

" Getting rid of arrow keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

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

" Change in next email
onoremap in@ :<c-u>execute "normal! /[a-zA-Z.-]\\+@\\w\\+\\.\\w\\+\rv/@\rh"<cr>

" Opens previous buffer in a vertical split on the right
nnoremap <leader>op :execute "rightbelow vsplit " . bufname("#")<cr>

" Default search to use 'very magic'
nnoremap / /\v

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader><space> :setlocal nohlsearch<cr>
" }}}

" Abbreviations and typo correction --- {{{
iabbrev @@ feliciousx@gmail.com
iabbrev ssig -- <cr>FeliciousX<cr>feliciousx@gmail.com
" }}}

" FileType-specific settings --- {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

augroup autoindent
    autocmd!
    autocmd BufRead *.cpp :normal gg=G
    autocmd BufRead *.c :normal gg=G
    autocmd BufRead *.java :normal gg=G
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python	nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> func function() {}<left><cr><up><esc>A
augroup END

augroup filetype_markdown
    autocmd!
    " Change in headings
    autocmd FileType markdown onoremap <buffer> ih :<c-u>execute
                \ "normal! ".'?\v^[=][=]+\|^--+$'."\r:nohlsearch\rkvg_"<cr>
    " Change around headings
    autocmd FileType markdown onoremap <buffer> ah :<c-u>execute
                \ "normal! ".'?\v^[=][=]+\|^--+$'."\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType php :iabbrev <buffer> fore foreach ()<left>
augroup END

augroup filetype_lua
    autocmd!
    autocmd FileType lua setlocal foldmethod=marker
augroup END

" }}}

