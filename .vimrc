set nocompatible

filetype off

" set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set fileencoding=utf-8 " The encoding written to file.

let mapleader = " " "the <leader> map
let plugins = 1 " 0 == false, 1 == true
let badTerminal = 0 " 0 == false, 1 == true

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'YouCompleteMe')
call add(g:pathogen_disabled, 'syntastic')
if has ("gui_running")
    call add(g:pathogen_disabled, 'vim-tmux-navigator')
else
    call add(g:pathogen_disabled, 'vim-airline')
endif
call add(g:pathogen_disabled, 'ctrlp')
call add(g:pathogen_disabled, 'ctrlp-py-matcher')

" Operating systems: macunix unix win32 win32unix
if has('macunix')
    " access the system clipboard as standard (*)
    set guifont=Monaco:h13
    set clipboard^=unnamed
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
else
    set guifont=Inconsolata\ 13
    " access the system clipboard as standard (+)
    set clipboard=unnamedplus
endif

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

if badTerminal == 0
    set list          " Display unprintable characters f12 - switches
    set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
else
    if has ("gui_running")
    else
        let plugins = 0 " 0 == false, 1 == true
        set bg=dark
    endif
endif

set mouse=a "be able to use mouse
colo mymolo
set colorcolumn=80

" to make quickfix work better
" set makeprg=vadduvill
" copen
set shell=bash

" read files when they change
set autoread

" save when anything happens
set autowrite
set autowriteall

" Set spelling on git commits
autocmd FileType gitcommit setlocal spell

if plugins == 1
    execute pathogen#infect()

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    autocmd FileType * unlet! g:airline#extensions#whitespace#checks
    autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
    let g:ctrlp_max_files=0
    let g:ctrlp_max_depth=40
    nnoremap <leader>gy :Ggrep "<C-R>""
    nnoremap <leader>gv y:Ggrep "<C-R>""
    nnoremap <leader>gr :Ggrep ""<left>
    let g:syntastic_cpp_checkers = ['gcc', 'clang_check', 'clang_tidy', 'cpplint' ]
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_include_dirs = [ '../inc', '../if', 'inc', 'if' ]
    let g:syntastic_cpp_compiler_options = ' -std=c++0x'
    " let g:syntastic_cpp_auto_refresh_includes = 1
endif

set number
set relativenumber

" turn syntax highlighting on
set t_Co=256
syntax on

filetype plugin indent on

" nnoremap P PggVG=''

set modelines=0  "security issues

" :set mouse=""

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
""command! MakeTags !ctags -R .
:set tags=.git/tags
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set spell

" set a directory to store the undo history
set undodir=~/.vimundo/

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

function! Codestyle()
    retab
    %s/\m\(\/\/\+<\?\)\([</]\|\s\|\n\)\@!/\1 /c
    %s/\m\([-=><]\|\s\)\@<!\([=<>]\?[=<>]\)\([=><]\|\s\|\n\)\@!/ \2 /gc
    %s/,\S\@=/, /gc
    %s/ ;/;/gc
endfunction
command! Codestyle execute "call Codestyle()"

function! FindInGitRepository(name)
    cex system('git-ls-quickfix ' . a:name)
    copen
endfunction
command! -range -nargs=1 F :call FindInGitRepository(<q-args>)

" DELETE BUFFERS-----------------------------------
" Do a :ls to see buffer numbers and them :x,ybd to delete buffers from number x to y
" from aswer by atomicules
" https://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()

set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q :q<Enter>
nnoremap <leader>f :find *
nnoremap <leader>e :Ex<Enter>
nnoremap <leader>n :NERDTree<Enter>
nnoremap <leader>N :NERDTreeClose<Enter>
nnoremap <leader>m "myiw:!get-merge <C-R>m<Enter>
inoremap <Tab> <C-N>

nnoremap <leader>cf :let @+=expand("%:p")<CR>    " Mnemonic: Copy File path
nnoremap <leader>yf :let @"=expand("%:p")<CR>    " Mnemonic: Yank File path
nnoremap <leader>fn :let @"=expand("%")<CR>      " Mnemonic: yank File Name

inor <C-D> <Right><Backspace>

" Go to function start
nnoremap <leader>s ?^\S<Enter>:noh<Enter>

set wrap
set textwidth=79
set formatoptions=qrn1

" Enhanced keyboard mappings
"
" in normal  will save the file
nnoremap <leader>w :w<CR>

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


"mappping moving trought windows in vertical fashion, maximixing the window
"you are on
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H>  <C-W>h
noremap <C-L>  <C-W>l

set wmh=0

noremap <C-Down>  <C-W>j
noremap <C-Up>  <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right>  <C-W>l

noremap <C-E>  4<C-E>
noremap <C-Y>  4<C-Y>

"Set hardmode"
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Add emacs style bindings:
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-P> <Up>
inoremap <C-N> <Down>
" "inoremap <C-K> <Esc>lDa
" "inoremap <C-U> <Esc>d0xi
" "inoremap <C-Y> <Esc>Pa
" "inoremap <C-X><C-S> <Esc>:w<CR>a

" Should be easy to exit insert mode!
inoremap <expr> <up> pumvisible() ? "\<up>" : "\<ESC><up>"
inoremap <expr> <down> pumvisible() ? "\<down>" : "\<ESC><down>"
inoremap <left> <ESC><left>
inoremap <right> <ESC><right>
inoremap jj <ESC>
inoremap kk <ESC>

" Do not like swedish keyboard for $
nnoremap € $
nnoremap ¤ $
nnoremap å [
nnoremap ¨ ]
nnoremap ä }
nnoremap ö {
inoremap € $
inoremap ¤ $
inoremap ¨ ]
inoremap ä }
inoremap ö {
inoremap ö {}<left>
inoremap ö<CR> {<CR>}<ESC>O
inoremap {<CR> {<CR>}<ESC>O
vnoremap € $
vnoremap ¤ $
vnoremap å [
vnoremap ¨ ]
vnoremap ä }
vnoremap ö {
inoremap ,å å
inoremap ,¨ ¨
inoremap ,ä ä
inoremap ,ö ö
nnoremap œ <C-o> " Go back with alt-o on swedish keyboard

" Search selected text
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

"autoclose parenthesis
ino < <><left>
ino << <<

"do not need to press ESC to save and exit from insert mode
inoremap :wq <ESC>:wq<CR>
inoremap ZZ <ESC>:wq<CR>
inoremap <C-S> <ESC>:w<CR>
nnoremap <C-S> :w<CR>

"Copy paste to clipboard
nnoremap <Leader>p o<ESC>"+p
inoremap <C-V> <ESC>"+pa
cnoremap <C-V> <C-R>+

" Add a ; in the end of line
nnoremap <Leader>, $a;<ESC>


" Skip pressing o end esc all the time i need a space
nnoremap <Leader>O O<Esc>xxxj
nnoremap <Leader>o o<Esc>xxx
nnoremap <S-Enter> o<Esc>

" Import some emacs in the command mode:
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>
cnoremap <C-d>  <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><C-w>

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


autocmd QuickFixCmdPost *grep* cwindow

" get rid of trailing whitespaces
noremap <Leader>t :%s/\s\+$//e<CR>

autocmd bufnewfile *.sh so ~/.vim/templates/bash_header.txt
autocmd bufnewfile *.sh exe "1," . 10 . "g/FILENAME:.*/s//FILENAME: " .expand("%")
autocmd bufnewfile *.sh exe "1," . 10 . "g/CREATION DATE:.*/s//CREATION DATE: " .strftime("%d-%m-%Y")
autocmd bufnewfile *.sh :normal G
autocmd Bufwritepre,filewritepre *.sh execute "normal ma"

autocmd Bufwritepre,filewritepre *.sh exe "1," . 10 . "g/LAST MODIFIED:.*/s/LAST MODIFIED:.*/LAST MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.sh execute "normal `a"

autocmd bufnewfile *.py so ~/.vim/templates/python3_header.txt

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nospell
augroup END

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





