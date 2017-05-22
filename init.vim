" File: `~/.config/nvim/init.vim`

" Run `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim` and :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim

" SECTION Vundle --- {{{
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'w0rp/ale' " linter
Plugin 'scrooloose/nerdtree' " NERD Tree file browser
Plugin 'Xuyuanp/nerdtree-git-plugin' " NERD Tree git status
Plugin 'bling/vim-airline' " Status bar
Plugin 'tpope/vim-surround' " Vim bracket/parantheses wrapping
Plugin 'rking/ag.vim' " the_silver_searcher support
Plugin 'tpope/vim-fugitive' " Git helper
Plugin 'sheerun/vim-polyglot' " Syntax for many file-types
Plugin 'cloudhead/neovim-fuzzy' " fuzzy search
Plugin 'jiangmiao/auto-pairs' " Auto closing brackets

" Colorschemes plugins --- {{{
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'morhetz/gruvbox'
Plugin 'ajh17/Spacegray.vim'
" }}}

call vundle#end()
" }}}

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
syntax enable
set background=dark
color gruvbox

" }}}

" Basic settings --- {{{
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

set t_Co=256

let mapleader = "\\"
let localmapleader = ","

" Auto Pair settings --- {{{
let g:AutoPairsMapCR = 0
" }}}

" Setting up vim-airline powerline
let g:airline_powerline_fonts = 1
set laststatus=2
set guifont=Hack

" Sets NERDTree to open by default
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Set Ack to use Silver Searcher (Ag)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Ale lint settings --- {{{
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {'javascript': ['eslint']}
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

" Opens previous buffer in a vertical split on the right
nnoremap <leader>op :execute "rightbelow vsplit " . bufname("#")<cr>

" Default search to use 'very magic'
nnoremap / /\v

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader><space> :setlocal nohlsearch!<cr>
" }}}

" Remaps & shortcuts
:nnoremap <C-p> :FuzzyOpen<CR>
" Ctrl + S to search
:nnoremap <C-s> :Ag <Space>
" Ctrl + T to open a new tab
:nnoremap <C-t> :tabnew <Enter>
" Ctrl + ] to switch to next tab
:nnoremap <C-]> :tabnext<CR>
" Ctrl + [ to switch to previous tab
:nnoremap <C-[> :tabprevious<CR>
" Ctrl + E to open file-search pane
:nnoremap <C-e> :NERDTree <Enter>
" Ctrl + Z to undo
:nnoremap <C-z> :undo <Enter>
" Ctrl + Y to redo
:nnoremap <C-y> :redo <Enter>
" Ctrl + Left to split left
:nnoremap <C-Left> <C-W>h
" Ctrl + Down to split below
:nnoremap <C-Down> <C-W>j
" Ctrl + Up to split above
:nnoremap <C-Up> <C-W>k
" Ctrl + Right to split right
:nnoremap <C-Right> <C-W>l
" Ctrl + Alt + T to open terminal
:nnoremap <C-A-t> :terminal <Enter>

