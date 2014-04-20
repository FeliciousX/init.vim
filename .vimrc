" set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'zeis/vim-kolor'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized.git' 
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" scripts not on GitHub
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/gmarik/path/to/plugin'
" ...

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
" Put your stuff after this line
"

set incsearch
set ignorecase smartcase
set nohlsearch
set number

syntax enable
set background=dark
colorscheme solarized

let mapleader = ","
let localmapleader = "\\"

" Exit from modes to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Cancels arrow key in modes
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>


" Move to start or end of line with H and L
nnoremap H 0
nnoremap L $

" Move entire line down with - and up with _
nnoremap _ ddkkp
nnoremap - ddp

" Make current word uppercase
inoremap <leader><c-u> <esc>evbUea
nnoremap <leader><c-u> evbUel

" Edit vimsrc and source 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Cover word with quotation marks
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>


" Shortcuts in insert mode
iabbrev @@ feliciousx@gmail.com
iabbrev ssig -- <cr>FeliciousX<cr>feliciousx@gmail.com

" Auto indent files
autocmd BufWritePre,BufRead *.html :normal gg=G

" Comments for different file types
augroup filetype_html
	autocmd!
	autocmd FileType html setlocal nowrap
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType python	nnoremap <buffer> <leader>c I#<esc>
augroup END

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
augroup END

augroup filetype_markdown
	autocmd!
	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+\\\|^--\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+\\\|^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

" Deleting stuff in paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! f(vi(<cr>

" Change in next email
onoremap in@ :<c-u>execute "normal! /[a-zA-Z.-]\\+@\\w\\+\\.\\w\\+\rv/@\rh"<cr>

