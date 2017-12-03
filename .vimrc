filetype off
execute pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible

set modelines=0  "security issues

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

":set mouse=a "be able to use mouse
:set mouse="" 

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
"set undofile

set ignorecase
set smartcase

let mapleader = "," "the <leader> map

set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80


"mappping moving trought windows in vertical fashion, maximixing the window
"you are on
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
nnoremap <S-Up> <C-W>k<C-W>_
nnoremap <S-Down> <C-W>j<C-W>_ 

set wmh=0

noremap ª <C-W>j
noremap º <C-W>k
noremap ∆ <C-W>h
noremap ¬ <C-W>l

noremap <A-Down> <C-W>j  
noremap <A-Up> <C-W>k
noremap <A-Left> <C-W>h
noremap <A-Right> <C-W>l>



"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop> optionally make life relly hard and pure!
nnoremap j gj
nnoremap k gk
inoremap jj <ESC> 

nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
set guifont=Menlo:h11 "should only work on mac

au FocusLost * :wa  "save automatically

