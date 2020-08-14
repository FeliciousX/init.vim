" File: `~/.config/nvim/init.vim`
filetype off

" SECTION DEIN --- {{{
" https://github.com/Shougo/dein.vim
" Installed to ~/.config/nvim/bundle

if &compatible
  set nocompatible " Be iMproved
endif

let dein_install_path = $HOME . '/.config/nvim'
let dein_path = dein_install_path . '/repos/github.com/Shougo/dein.vim'
let &runtimepath .=','.dein_path

" Required:
if dein#load_state(dein_install_path)
  call dein#begin(dein_install_path)

  " Let dein manage dein
  " Required:
  call dein#add(dein_path)

  " Add or remove your plugins here:
  call dein#add('vimwiki/vimwiki') " vimwiki
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-repeat')
  call dein#add('scrooloose/nerdtree',
    \{'on_cmd': 'NERDTreeToggle'})
  call dein#add('Xuyuanp/nerdtree-git-plugin',
    \{'on_cmd': 'NERDTreeToggle'})    " Git support in NERD Tree
  call dein#add('vim-airline/vim-airline')        " Status bar
  call dein#add('vim-airline/vim-airline-themes') " Status bar themes
  call dein#add('tpope/vim-surround')             " Vim bracket/parentheses wrapping
  call dein#add('cloudhead/neovim-fuzzy')         " Fuzzy search with fzy
  call dein#add('jremmen/vim-ripgrep')            " search with :Rg
  call dein#add('tpope/vim-fugitive')             " Git stuff
  call dein#add('airblade/vim-gitgutter')         " Git annotations
  call dein#add('Valloric/MatchTagAlways')        " HTML tag highlight and jumping
  call dein#add('maralla/completor.vim', {'build': 'make js'}) " Auto complete
  call dein#add('w0rp/ale')                       " Asynchronous Lint Engine
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('sheerun/vim-polyglot', {'merged': 0})
  call dein#add('luochen1990/rainbow')
  call dein#add('miyakogi/seiya.vim') " make background transparent

  " Syntax support
  call dein#add('pangloss/vim-javascript') " javascript syntax highlighting
  call dein#add('mhartington/nvim-typescript',
    \{'build': './install.sh'}) " typescript syntax highlighting

  " colorschemes
  call dein#add('morhetz/gruvbox')                " gruvbox theme
  call dein#add('nathanaelkane/vim-indent-guides') " indentation guide

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
color gruvbox
let g:seiya_auto_enable=1 " set transparency
" }}}

" Basic settings --- {{{
set backupcopy=yes
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

" deoplete settings
let g:deoplete#enable_at_startup = 1

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

" Set rainbow --- {{{
let g:rainbow_active = 1
" }

let mapleader = "\\"
let localmapleader = ","

" Setting up vim-airline powerline
let g:airline_powerline_fonts = 1
set laststatus=2

let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'eruby' : 1, 'javascript.jsx' : 1 }
let g:jsx_ext_required = 0

" ALE Config --- {{{
let g:ale_linters = {
  \ 'vue': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'haskell': ['stack-ghc-mod', 'hlint', 'hfmt']
  \ }

let g:ale_fixers = {
  \ 'vue': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint']
  \ }
" }}}

" Nord config
let g:nord_comment_brightness = 20

" }}}

" vimwiki config
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

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

" for when Dafne uses my vim
inoremap jj <esc>

" Allow moving up and down even when word is wrapped
nnoremap j gj
nnoremap k gk

" Move to start or end of line with H and L
nnoremap H 0
nnoremap L $

" Move entire line down with - and up with _
nnoremap _ ddkkp
nnoremap - ddp

" Edit .vimrc and source
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Default search to use 'very magic'
nnoremap / /\v

nnoremap // y/<c-R>"<cr>

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader><space> :setlocal nohlsearch!<cr>

" new tab
nnoremap <C-t> :tabe<cr>
" }}}

set autoread " trigger filetype checking

set exrc
set secure
