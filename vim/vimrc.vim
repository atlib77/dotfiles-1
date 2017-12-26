set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime ath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Atli 
Plugin 'tmux-plugins/vim-tmux'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
" Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
" Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'gioele/vim-autoswap'
" Plugin 'vim-scripts/taglist.vim'
" Plugin 'artur-shaik/vim-javacomplete2'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" General Vim settings
syntax on
let mapleader=","
set autoindent
set dir=~/tmp,~/.tmp,/tmp/,
set nowrap 
set number
set relativenumber 
set updatetime=250
set shiftwidth=4
set tabstop=4
set scrolloff=1
set cursorline!
set ignorecase
set incsearch
set hlsearch
set listchars=tab:\|\ 
set pastetoggle=<F2>
set mouse=a
set mousehide
set autochdir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set winheight=30
set winminheight=5

colorscheme desert

hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" This one conflicted with Ctlr-o and Cltr-l (for jumping through the
" :jumps list)
" nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

" When searching for next match, center the line on the screen
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap H 0
nnoremap L $
" nnoremap J <C-f>
" nnoremap K <C-b> 

map <tab> %
imap jk <ESC>

autocmd FileType help noremap <buffer> q :q<cr>

if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

" Auto resize windows
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


" Move around windows 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle current fold with space
nnoremap <Space> za
nnoremap <leader>z zMzvzz

nnoremap vv 0v$

nnoremap <leader><tab> :set list!<cr>

" File and Window Management 
"  Save file  
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

" Close window 
inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>

" Hard close
inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>

" Ex command mode
nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	let g:ctrlp_use_caching = 1
endif


let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir',
			\ 'changes', 'mixed', 'bookmarkdir']

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw
nnoremap \ :Ag<SPACE>


" NERDTree settings
" " open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" How can I map a specific key or shortcut to open NERDTree?
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" Not working:
" " " Autoclose vim if NERDTree is the last open window
" autocmd BufEnter * if (winnr("$") == 0 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd Filetype java compiler mvn
autocmd Filetype pom compiler mvn


" vim-airline
let g:airline_powerline_fonts=1
" let g:airline_right_alt_sep = ''    
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep= ''
" let g:airline_left_sep = ''
" if !exists('g:airline_symbols')
" let g:airline_symbols = {}
" endif
let g:airline#extensions#tabline#enabled = 1  

" vim-autoswap
set title titlestring=
let g:autoswap_detect_tmux = 1

" vim-lsp - No success with this yet:
" if executable('docker-langserver')
" 	au User lsp_setup call lsp#register_server({
" 				\ 'name': 'docker-langserver',
" 				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
" 				\ 'whitelist': ['dockerfile','Dockerfile'],
" 				\ })
" endif


" au User lsp_setup call lsp#register_server({
"         \ 'name': 'jals',
"         \ 'cmd': {server_info->['~/github/start-java-lang-server']},
"         \ 'whitelist': ['python'],
"         \ })

" autocmd bufwritepost .vimrc source $MYVIMRC

" autocmd bufwritepost aliases source aliases

" This one gives the autocomplete from java base libraries:
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd FileType java setlocal omnifunc=


