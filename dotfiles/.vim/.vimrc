" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
set encoding=utf8

" Mappings
    let mapleader=","
    
    " Universal
"   map <space> /
"   map <C-space> ?

    " Visual
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

    " Insert
    inoremap ( ()<esc>i
    inoremap [ []<esc>i
    inoremap { {}<esc>i
    inoremap ' ''<esc>i
    inoremap " ""<esc>i
    inoremap (( (
    inoremap [[ [
    inoremap {{ {
    inoremap '' '
    inoremap "" "
 
    " Normal
    noremap s :


" Fyle Options
    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on
    " Enable plugins and load plugin for the detected file type.
    filetype plugin on
    " Load an indent file for the detected file type.
    filetype indent on
    " Enable sintax Higlighting
    syntax on

" indentation
    set autoindent
    set expandtab
    set tabstop=4
    set shiftwidth=4


    let &t_ut=''
    let g:netrw_winsize=25
    let g:netrw_preview=1

" miscelanious
    set fileformat=unix
    set showcmd
    set showmode
    set hidden
    set ignorecase
    set magic
    set noerrorbells
    set novisualbell
    set lazyredraw
    set ttyfast
    
    " MATCHING CHARACTERS
    set showmatch
    set matchtime=1
   
    " WILDMENU
""    set wildchar=<Tab>
    set wildmenu
    set wildmode=list,full:list
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx 

    " SEARCH
    set cmdheight=2
    set smartcase
    set hlsearch
    set incsearch

    " TERMINAL
    set t_vb=
    set tm=500
    set t_Co=256  









" -------------------------------------------------------------------
" -------------------------------------------------------------------
" PROGRAMMING
" -------------------------------------------------------------------
" -------------------------------------------------------------------

" autochdir
" autowrite
" autowriteall

set path=**
set go+=!
set background=dark
set backup
set writebackup
set nowrap
set backupdir=/var/backups/vimBackups/
set backspace=indent,eol,start
set history=100
set scrolloff=8
set omnifunc=syntaxcomplete#Complete

" Enable line numbers
set number
set relativenumber

colorscheme slate 
syntax enable







try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

set clipboard=unnamedplus
set clipboard+=unnamed

