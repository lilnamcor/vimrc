" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set cscopetag
set cst
set csto=0
set tags=./tags,tags;/
cs add cscope.out

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
"  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set autoindent

colorscheme inkpot

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
"set incsearch      " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
nnoremap <silent> <leader><space> :noh<cr>
set background=dark
set shiftwidth=2
set tabstop=2
set expandtab
set list
set number
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set nowrap
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set textwidth=100
set nobackup
set noswapfile
set hidden
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tjennings/git-grep-vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
let g:in_git = substitute(system('git rev-parse --show-toplevel2>/dev/null'), "\n*$", '', '')
let g:git_head = g:in_git . "/.git/HEAD"
if g:in_git != ''
    autocmd BufWritePost *.py execute ':silent !touch ' . g:git_head
    cd `=g:in_git`
    let g:ctrlp_user_command = 'cd %s && git ls-files . -co --exclude-standard'
endif
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR>
set formatoptions=qrn1
set showmatch
set vb t_vb=
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set scrolloff=3
set nrformats=
nnoremap <leader>v V`]
nnoremap / /\v
vnoremap / /\v
"au FileType python source ~/.vim/plugins/python.vim
filetype indent on
set modeline

" Turn autoindent/smartindent on or off for copy/paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>
" End

nnoremap <F5> :setlocal invnumber<CR>:setlocal invlist<CR>
nnoremap <F6> :vsp <CR> :ConqueTerm bash<CR>
set pastetoggle=<F3>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set cscopetag
let g:ycm_autoclose_preview_window_after_completion = 1
set splitbelow
