" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
set encoding=utf8
source $XDG_CONFIG_HOME/dotfiles/.vim/mappings.vim
source /home/asbel/.xdg/config/dotfiles/.vim/pack/vim-wayland-clipboard/start/vim-wayland-clipboard/plugin/wayland_clipboard.vim

" File Options
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.

filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Enable syntax Higlighting
syntax on
fixdel

" miscelanious
set fileformat=unix
set showcmd
set showmode
set hidden
set magic
set noerrorbells
set belloff=all
set novisualbell
set visualbell
set lazyredraw
set ttyfast
set nohlsearch

" MATCHING CHARACTERS
set noshowmatch
set matchtime=1
set clipboard=unnamedplus
set clipboard+=unnamed

" WILDMENU
set wildchar=<Tab>
set wildmenu
set wildmode=lastused:list,full:list
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx 

" SEARCH
set ignorecase
set cmdheight=2
set smartcase
set hlsearch
set incsearch

" TERMINAL
set t_vb=
set tm=500
set t_Co=256  

" INDENTATION
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

let &t_ut=''
let g:netrw_winsize=25
let g:netrw_preview=1


" -------------------------------------------------------------------
" -------------------------------------------------------------------
" PROGRAMMING
" -------------------------------------------------------------------
" -------------------------------------------------------------------

" autochdir
" autowrite
" autowriteall
" set spell
set undofile

set title
set path=**
set go+=!
set background=dark
set backup
set writebackup
set nowrap
set backupdir=/tmp
set backspace=indent,eol,start
set history=100

set scrolloff=8
set sidescrolloff=8
set omnifunc=syntaxcomplete#Complete

set list
set listchars=tab:<->,trail:.

set number
set relativenumber

colorscheme slate
syntax enable

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

set timeout
set timeoutlen=150
set ttimeoutlen=0

let g:tagbar_phpctags_memory_limit = '512M'
let g:airline_theme='ayu_mirage'

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'elkowar/yuck.vim'
Plug 'bhurlow/vim-parinfer'
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu


