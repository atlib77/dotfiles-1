set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Atli 
" Plugin 'honza/vim-snippets'
" Plugin 'kien/ctrlp.vim'
" Plugin 'valloric/youcompleteme'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'gioele/vim-autoswap'
Plugin 'godlygeek/tabular'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tfnico/vim-gradle'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/zoomwin'
Plugin 'tommcdo/vim-exchange'

" All of your Plugins must be added before the following line
 call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" General Vim settings
syntax on
set autoindent
set backupdir=~/.vim/backup//
set cursorline!
set dir=~/tmp,~/.tmp,/tmp/,
set directory=~/.vim/swap//
set fileignorecase
set hlsearch
set ignorecase
set incsearch
set listchars=tab:\|\ 
set mouse=a
set mousehide
set nowrap 
set number
set pastetoggle=<F2>
set relativenumber 
set scrolloff=1
set shiftwidth=2
set showcmd 
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set title titlestring=
set undodir=~/.vim/undo//
set updatetime=250
set wildignore+=*/.git/*,*/.svn/*,*/tmp/*,*/target/*,*/build/*,*/debug/*,*.so,*.swp,*.zip,*.jar,*.war,*.dtd
set winheight=30
silent! set winminheight=5
set winminheight=3
set wildignorecase
set wildmenu
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

colorscheme desert

" highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

" The Silver Searcher
if executable('ag')
	" Use ag over grep
    let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" CTRL-P plugin configuration
" let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = ''

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 1
let g:ctrlp_extensions = ['branch', 'tabline', 'mixed', 'bookmarkdir', 'buffertag', 'quickfix']

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']


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
let g:airline#extensions#tabline#fnamecollapse = 0
let g:autoswap_detect_tmux = 1

autocmd FileType help noremap <buffer> q :q<cr>
" autocmd Filetype java compiler mvn
" autocmd Filetype pom compiler mvn
autocmd FileType java setlocal omnifunc=javacomplete#Complete " This one gives the autocomplete from java base libraries
" autocmd FileType java setlocal omnifunc=
" autocmd bufwritepost .vimrc source $MYVIMRC
" autocmd bufwritepost aliases source aliases
" This one gives the autocomplete from java base libraries:
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd FileType java setlocal omnifunc=
" Auto resize windows
" Move around windows 
" Toggle current fold with space
" File and Window Management 
" When searching for next match, center the line on the screen
" This one conflicted with Ctlr-o and Cltr-l (for jumping through the
" :jumps list)
" nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
let mapleader=","
imap jk <ESC>
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>w <Esc>:w<CR>
inoremap <leader>x <ESC>:x<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
map <tab> %
" nnoremap : ;
" vnoremap : ;
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Spreace> za
nnoremap <leader><tab> :set list!<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>z zMzvzz
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap H 0
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap L $
nnoremap N Nzzzv
nnoremap \ :Ag<SPACE>
nnoremap vv 0v$
