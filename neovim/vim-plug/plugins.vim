" auto-install vim-plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Vim plugin for Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

    " Theme
    Plug 'joshdick/onedark.vim'

    if has("nvim")
      Plug 'neovim/nvim-lspconfig'
    endif


    " Telescope requirement
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'



call plug#end()


" NERD TREE
let NERDTreeIgnore = ['node_modules$']
nmap <leader>fd :NERDTreeFind<CR>
nmap <leader>\ :NERDTreeToggle<CR>

 

" Theme
syntax on
colorscheme onedark
