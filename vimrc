set nocompatible
filetype off
" I had to specify the shell, otherwise vundle was trying to use /bin/false
" and failing in MacOS
set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-dispatch'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'danro/rename.vim'
Bundle 'nono/vim-handlebars'
Plugin 'scrooloose/nerdtree.git'

call vundle#end()
filetype plugin indent on

set grepprg=ack " Had to use ack and not ack-grep in Mac
set tags=./tags;
set autoindent

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

syntax enable

set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set nu

set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

let g:vroom_map_keys = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1

map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file
map <leader>E :Explore .<cr> " \E to open file explorer in root
map <leader>e :Explore<cr> " \e to open file explorer in current dir

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
"
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
