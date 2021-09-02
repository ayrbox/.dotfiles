
let mapleader = " "

set modifiable  " allow buffer to be modifiable
set number " show number
set relativenumber " show relative number
set bg=dark
set noswapfile
set termguicolors
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set autoindent
set nobackup
set hlsearch
set shell=fish
set title
set nowrap


source ~/.config/nvim/vim-plug/plugins.vim



" Escape highlight
nmap <leader><esc> :noh<CR>


" yank to clipboard
if has("clipboard")
	set clipboard=unnamed "copy to system clipboard
	if has("unnamedplus")
		set clipboard+=unnamedplus
	endif
endif


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>



" GUI Client
set guifont=Fira\ Mono:h25
