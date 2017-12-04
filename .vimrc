
set nocompatible
filetype off
let g:pathogen_disabled = []

if has ("gui_running")
	execute pathogen#infect()
	set colorcolumn=80
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

syntax on
filetype plugin indent on


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
nnoremap <leader>p :CtrlP<Enter>
nnoremap <Tab> :NERDTree<Enter>

set wrap
set textwidth=79
set formatoptions=qrn1


"mappping moving trought windows in vertical fashion, maximixing the window
"you are on
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
nnoremap <S-Up> <C-W>k<C-W>_
nnoremap <S-Down> <C-W>j<C-W>_ 

set wmh=0

"noremap ª <C-W>j
"noremap º <C-W>k
"noremap ∆ <C-W>h
"noremap ¬ <C-W>l

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
set guifont=Inconsolata\ 13 

au FocusLost * :wa  "save automatically


"nsible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
 " Version:      1.1

 if exists('g:loaded_sensible') || &compatible
   finish
  else
    let g:loaded_sensible = 'yes'
 endif

   if has('autocmd')
      filetype plugin indent on
     endif
     if has('syntax') && !exists('g:syntax_on')
     syntax enable
   endif

         " Use :help 'option' to see the documentation for the given option.

    set autoindent
    set backspace=indent,eol,start
    set complete-=i
    set smarttab

    set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
      set ttimeout
      set ttimeoutlen=100
endif

set incsearch

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
      set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline

 if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
 endif

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
     set formatoptions+=j " Delete comment character when
"                        joining commented lines
endif

if has('path_extra')
      setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif 

if  &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))

set shell=/bin/bash
endif
set autoread

if &history < 1000
       set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors
"  without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
       set t_Co=16
endif

" Load matchit.vim, but only if the user
"   hasn't installed a newer version.
if  !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:





