set nocompatible

filetype off

" set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set fileencoding=utf-8  " The encoding written to file.
"let g:pathogen_disabled = []

set bg=dark

if has ("gui_running")
    execute pathogen#infect()
    colo molokai
    set colorcolumn=80
    autocmd FileType * unlet! g:airline#extensions#whitespace#checks
    autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
    let g:ctrlp_max_files=0
    let g:ctrlp_max_depth=40
endif


let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" turn syntax highlighting on
set t_Co=256
syntax on

filetype plugin indent on

set modelines=0  "security issues


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

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" use intelligent indentation for C
set smartindent

set ignorecase
set smartcase

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

let mapleader = "," "the <leader> map


set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>p :CtrlP<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <Tab> :NERDTree<Enter>

set wrap
set textwidth=79
set formatoptions=qrn1

" Enhanced keyboard mappings
"
" in normal  will save the file
nnoremap <leader-M> :w<CR>
" in insert will exit insert, save, enters insert again
inoremap <leader-M> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


"mappping moving trought windows in vertical fashion, maximixing the window
"you are on
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
nnoremap <S-Up> <C-W>k<C-W>_
nnoremap <S-Down> <C-W>j<C-W>_

set wmh=0

noremap <C-Down>  <C-W>j
noremap <C-Up>  <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right>  <C-W>l


noremap . :
noremap \ .


"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"
"Should be easy to exit insert mode!
inoremap <expr> <up> pumvisible() ? "\<up>" : "\<ESC><up>"
inoremap <expr> <down> pumvisible() ? "\<down>" : "\<ESC><down>"
inoremap <left> <ESC><left>
inoremap <right> <ESC><right>
inoremap jj <ESC>
inoremap kk <ESC>

nnoremap j gj
nnoremap k gk

"do not need to press ESC to save and exit from inserto mode
inoremap :w <ESC>:w<CR>
inoremap :wq <ESC>:wq<CR>
inoremap .w <ESC>:w<CR>
inoremap .wq <ESC>:wq<CR>
inoremap <C-S> <ESC>:w<CR>
nnoremap <C-S> :w<CR>

"Copy paste to clipboard
nnoremap <Leader>c "+y
vnoremap <Leader>c "+y
nnoremap <Leader>v "+p
vnoremap <Leader>v "+p
nnoremap <Leader>x "+d
vnoremap <Leader>x "+d

nnoremap <S-Enter> o<Esc>

" in diff mode we use the spell check keys for merging
"if &diff
"  ” diff settings
"  map <Down> ]c
"  map <Up> [c
"  map <Left> do
"  map <Right> dp
"  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
"else
"  " spell settings
"  :setlocal spell spelllang=en
"  " set the spellfile - folders must exist
"  set spellfile=~/.vim/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
"endif

set guifont=Inconsolata\ 13

au FocusLost * :wa  "save automatically

autocmd QuickFixCmdPost *grep* cwindow

"autoclose parenthesis

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
" get rid of trailing whitespaces
noremap <Leader>t :%s/\s\+$//e<CR>

"Sensible.vim - Defaults everyone can agree on
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
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
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

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:





