" nocompatible lets vim add features at the expensive of breaking backwards
" compatibility.
set nocompatible

" Start loading plugins
call plug#begin()

" vim-sensible is a set of defaults which most people can agree on. It's
" mostly just here because it sets some nice things and works as a simple
" plugin example.
Plug 'tpope/vim-sensible'

" Actually load plugins
call plug#end()

" Set the colorscheme and turn on filetype stuff
set background=dark
colorscheme pablo
syntax on
filetype plugin indent on

" Enable line numbers and relative line numbers. Note that enabling both makes
" the current line absolute and all the other lines relative.
set number
set relativenumber

" Quicker exit of insert mode
set ttimeout
set ttimeoutlen=0

" Enable the mouse
set mouse=a

" Tab settings. Often times these will be overwritten for different filetypes.
set tabstop=4
set shiftwidth=4
set noexpandtab

" Any filetype specific overrides
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown  
