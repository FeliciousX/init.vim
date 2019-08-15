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
let g:python_host_prog = expand('~/.virtualenvs/neovim2/bin/python2')
let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python3')

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
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-repeat')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree',
    \{'on_cmd': 'NERDTreeToggle'})
  call dein#add('Xuyuanp/nerdtree-git-plugin',
    \{'on_cmd': 'NERDTreeToggle'})    " Git support in NERD Tree
  call dein#add('vim-airline/vim-airline')        " Status bar
  call dein#add('vim-airline/vim-airline-themes') " Status bar themes
  call dein#add('tpope/vim-surround')             " Vim bracket/parentheses wrapping
  call dein#add('cloudhead/neovim-fuzzy')         " Fuzzy search with fzy
  call dein#add('Numkil/ag.nvim')                 " search with silver searcher
  call dein#add('tpope/vim-fugitive')             " Git stuff
  call dein#add('airblade/vim-gitgutter')         " Git annotations
  call dein#add('Valloric/MatchTagAlways')        " HTML tag highlight and jumping
  call dein#add('maralla/completor.vim')          " Auto complete
  call dein#add('w0rp/ale')                       " Asynchronous Lint Engine
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('luochen1990/rainbow')
  call dein#add('miyakogi/seiya.vim') " make background transparent

  call dein#add('alx741/vim-hindent',
    \{'on_ft': ['haskell']})
  call dein#add('parsonsmatt/intero-neovim',
    \{'on_ft': ['haskell']})

  " markdown preview
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'cd app & yarn install' })

  " Syntax support
  call dein#add('sheerun/vim-polyglot')
  call dein#add('mhartington/nvim-typescript',
    \{'build': './install.sh'}) " typescript language service

  " colorschemes
  call dein#add('morhetz/gruvbox')                " gruvbox theme
  call dein#add('nathanaelkane/vim-indent-guides') " indentation guide

  call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })

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

nnoremap <F5> :syntax sync fromstart<cr>

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
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
      \ 'disabled_syntaxes', ['Comment', 'String'])

let g:deoplete#sources = {'_': ['ale']}

call deoplete#custom#option('sources', {
  \ 'vue': ['LanguageClient'],
\})

let g:LanguageClient_serverCommands = {
  \ 'vue': ['vls'],
\}
  "\ 'javascript': ['javascript-typescript-stdio'],
  "\ 'javascript.jsx': ['javascript-typescript-stdio'],
  "\ 'typescript': ['javascript-typescript-stdio'],

let g:LanguageClient_rootMarkers = {
  \ 'vue': ['package.json', 'tsconfig.json', '.git'],
\ }

let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
let g:LanguageClient_selectionUI = 'location-list'

" keybindings for language client
nnoremap <F4> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent> gc :call LanguageClient_textDocument_formatting()<CR>

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  "au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 0
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0

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
  \ 'vue': [],
  \ 'javascript': ['standard'],
  \ 'typescript': [],
  \ 'haskell': ['stack-ghc-mod', 'hlint', 'hfmt']
  \ }

let g:ale_fixers = {
  \ 'vue': ['eslint', 'prettier'],
  \ 'javascript': ['standard', 'prettier'],
  \ 'typescript': ['tslint', 'standard', 'prettier']
  \ }

let g:airline#extensions#ale#enabled = 1
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

" ag search --- {{{
nnoremap <C-s> :Ag<space>
" }

" Toggles NERDTree
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-e> :NERDTreeFind<CR>

" ALE Mapping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Exit from insert mode
inoremap jk <esc>

" for when Tim uses my vim
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
