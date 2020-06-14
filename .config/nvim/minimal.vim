set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

tnoremap <Esc> <C-\><C-n>


call plug#begin()
"Plug 'SirVer/ultisnips', {'for': ['plaintex', 'tex']}
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['plaintex', 'tex']}
Plug 'mhinz/neovim-remote'
Plug 'lervag/vimtex'
call plug#end()

set nocompatible
filetype plugin indent on
syntax enable

let g:tex_flavor = "latex"
let g:tex_conceal = ''
let mapleader = ','
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'

