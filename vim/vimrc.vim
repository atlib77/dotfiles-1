set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Atli 
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
 call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" General Vim settings
syntax on
set autoindent
set backupdir=~/.vim/backup
set cursorline!
set dir=~/tmp,~/.tmp,/tmp
" set directory=~/.vim/swap/
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
" set relativenumber 
set scrolloff=1
set shiftwidth=2
set showcmd 
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set title titlestring=
set undodir=~/.vim/undo
set updatetime=250
set wildignore+=*/.git/*,*/.svn/*,*/tmp/*,*/target/*,*/build/*,*/debug/*,*.so,*.swp,*.zip,*.jar,*.war,*.dtd
" set winheight=30
" silent! set winminheight=5
" set winminheight=3
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

if executable('rg')
	" Use ripgrep for searching ⚡️

    set grepprg=rg\ -H\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m

	" Use ripgrep in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'rg %s --files --hidden --smart-case --color=never --glob ""'
else
	let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

" CTRL-P plugin configuration
" let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']


" vim-airline
let g:airline_powerline_fonts=1
let g:airline_extensions = ['ctrlp', 'quickfix', 'tabline']

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
" autocmd bufwritepost .vimrc source $MYVIMRC
" autocmd bufwritepost aliases source ~/dotfiles/aliases

let mapleader=","
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>w <Esc>:w<CR>
inoremap <leader>x <ESC>:x<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
map <tab> %
" nnoremap : ;
" vnoremap : ;
" nmap <F8> :TagbarToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Toggle current fold with space
nnoremap <Space> za
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
nnoremap <leader>c :set nohlsearch!
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap H 0
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap L $
nnoremap N Nzzzv
nnoremap \ :grep<SPACE>
nnoremap vv 0v$

" nmap <F5> :exec '!'.getline('.')
" imap <F5> :exec '!'.getline('.')


if &diff
  nnoremap <space> ]cz.
  nnoremap <S-space> [cz.

  nnoremap <F7> ]cz.
  nnoremap <F8> [cz.
  nnoremap <S-F7> [cz.

  nnoremap <F5> :diffupdate<CR>

  set diffopt=filler
  windo set foldlevel=999999
  execute "normal \<c-w>\<c-w>"
endif
