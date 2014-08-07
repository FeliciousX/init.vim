" Vundle settings ----------------------------- {{{
set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Bundles available on github --- {{{
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'zeis/vim-kolor'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
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

" Basic settings --- {{{
set incsearch hlsearch
set ignorecase smartcase

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set background=dark
colorscheme solarized

let mapleader = ","
let localmapleader = "\\"
" }}}

" Mappings --- {{{
" Exit from insert mode
inoremap jk <esc>

" Move to start or end of line with H and L
nnoremap H 0
nnoremap L $

" Move entire line down with - and up with _
nnoremap _ ddkkp
nnoremap - ddp

" Make current word uppercase
inoremap <leader><c-u> <esc>evbUea
nnoremap <leader><c-u> evbUel

" Edit .vimsrc and source
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Cover word with quotation marks in normal mode and visual mode
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" Deleting stuff in paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! f(vi(<cr>

" Change in next email
onoremap in@ :<c-u>execute "normal! /[a-zA-Z.-]\\+@\\w\\+\\.\\w\\+\rv/@\rh"<cr>

" Opens previous buffer in a vertical split on the right
nnoremap <leader>op :execute "rightbelow vsplit " . bufname("#")<cr>

" Default search to use 'very magic'
nnoremap / /\v

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader>W :setlocal nohlsearch<cr>
" }}}

" Status line --- {{{
set laststatus=2	  " Always show status bar

set statusline=%.25f      " Path to the file
set statusline+=\ %y	  " Filetype of file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
" }}}

" Abbreviations and typo correction --- {{{
iabbrev @@ feliciousx@gmail.com
iabbrev ssig -- <cr>FeliciousX<cr>feliciousx@gmail.com
" }}}

" FileType-specific settings --- {{{
augroup filetype_html
	autocmd!
	autocmd FileType html setlocal nowrap
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
	" Auto indent html file
	autocmd BufWritePre,BufRead *.html :normal gg=G
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType python	nnoremap <buffer> <leader>c I#<esc>
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
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
	autocmd FileType php :iabbrev <buffer> pub public
	autocmd FileType php :iabbrev <buffer> pri private
	autocmd FileType php :iabbrev <buffer> func function
	autocmd FileType php :iabbrev <buffer> php <?php
	autocmd FileType php :iabbrev <buffer> fore foreach ()<left>
	autocmd FileType php :iabbrev <buffer> for for ()<left>
augroup END
" }}}

