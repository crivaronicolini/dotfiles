set nocompatible
set langmenu=en_US
let $LANG = 'en_US'
let mapleader=" "

"""COLOR"""
syntax on
filetype plugin indent on
syntax enable
colorscheme PaperColor
set background=dark

let g:python3_host_prog = '/usr/bin/python3'

set shortmess+=c
"para hacer que el output de python se vea
let $PYTHONUNBUFFERED=1
"cosas de python
let python_highlight_all = 1
" Give me a prompt instead of just rejecting risky :write, :saveas
set confirm

" Break lines at word boundaries
set linebreak

" Show search matches as I type my pattern
set incsearch
set noswapfile
set ttyfast
set noshowmode
set writebackup
set smartcase
set path+=**
set expandtab
set textwidth=0
set tabstop=8
set softtabstop=4
set shiftwidth=4
set scrolloff=12
set autoindent
set matchtime=1
set mouse=a
set laststatus=2
set backspace=indent,eol,start
set inccommand=nosplit

"wildmode settings
"set wildmenu
set wildmode=longest,full
silent! set wildignorecase  " Case insensitive, if supported
set wildoptions=pum


" New windows go below or to the right of a split
set splitright

" Don't assume I'm editing C; let the filetype set this
set include=

" Keep much more command and search history
set history=2000

" Delete comment leaders when joining lines, if supported
silent! set formatoptions+=j

" Don't wait for a key after Escape in insert mode
silent! set noesckeys

" Try to keep undos in one dir
set undolevels=1000
set undofile
set undodir^=/home/marco/.vim/cache/undo

" Try to keep backups in one system-appropriate dir
set backup
set backupdir^=/home/marco/.vim/cache/backup

"para que vim recuerde donde quedo
set viminfo='1000,f1,:100,%

set statusline=\ %<%f\ %m\ %y%=reg[%{v:register}]\ %l/%L
let g:markdown_fenced_languages = ['python']

"""""SETTINGS"""""
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1500) . 'm'
  call matchdelete(ring)
  redraw
endfunction

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nmap <S-Right> :vertical resize +3<cr>
nmap <S-Left> :vertical resize -3<cr>
nmap <S-Down> :resize +3<cr>
nmap <S-Up> :resize -3<cr>

"""""MAPEOS"""""

" Cycle through buffers
nnoremap <silent>{ :bprevious<CR>
nnoremap <silent>} :bnext<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>b :b <C-d>
nnoremap <silent><Leader>q :Bclose<CR>

"usa lead y d para copiar y pegar al portapapeles
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

"usa lead p para pegar
nnoremap <Leader>p :set paste<CR>"+]p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+]P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+]p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+]P:set nopaste<CR>

"repite el ultimo macro
nnoremap Q @@

" \g changes directory to the current file's location
nnoremap <Leader>c :<C-U>cd %:h<CR>:pwd<CR>
nnoremap <silent><Leader>C :let @+=expand('%:p:h')<CR>

"usa S para reemplazar
nnoremap <Leader>S :%s//g<Left><Left>
nnoremap <Leader>s :s//g<Left><Left>

"abre y cierra goyo
nmap <F3> :Goyo!<CR>

"hv para help vertical
cmap vh vert h

"deja hacer las cosas cuando tipeas rápido
cnoreabbrev W w
cnoreabbrev Q q

"usa H para buscar info con plugin better K y M para unir líneas
nnoremap H K
nnoremap M J

"usa J y K para mover entre parrafos
nnoremap K 6k
nnoremap J 6j
vnoremap K 6k
vnoremap J 6j

"usa Y para copiar hasta el final de linea como D y A
nnoremap Y y$

"P es poner al final
noremap P $p

"linea en blanco
nnoremap ñ o<Esc>
nnoremap Ñ O<Esc>

"vuelve a seleccionar cuando cambias la indentacion
vnoremap < <gv
vnoremap > >gv

"usa Ctrl-u para rehacer
noremap <C-u> <C-r>

"F9 para repasar spelling
nnoremap <F9> :silent setlocal spell! spelllang=es,en<CR>

"agarra la letra bajo el cursor y la vuelve a poner con tilde
nnoremap <silent> ´ s<c-r>=tr(@", 'aeioucnAEIOUCNáéíóúçñÁÉÍÓÚÇÑ', 'áéíóúçñÁÉÍÓUÇÑaeioucnAEIOUCN')<cr><esc>

"saca el highlight
nnoremap <silent> <F4> :noh<CR>

"corta el undo tree en cada punto, asi no se borra todo con un u
autocmd Filetype markdown inoremap . .<c-g>u
autocmd Filetype markdown inoremap ¿ `



"ejecuta el archivo actual
autocmd Filetype markdown map <F5> :!clear<CR><CR> :w<bar>!pandoc <C-r>% --pdf-engine=pdflatex -o %:p:h/%:r.pdf --variable urlcolor=blue -V geometry:margin=1in<CR>

autocmd BufNewFile,BufReadPost *.pmd set filetype=pweave syntax=pweave

autocmd Filetype pweave map <F5> :w <bar>:!pweave -o %:r.md -f markdown %<CR>:!pandoc <C-r> %:r.md --pdf-engine=pdflatex -o  %:p:h/pdf/%:r.pdf<CR>

autocmd! BufWritePost _vimrc source %

map <leader>o :!zathura %:p:h/pdf/%:r.pdf >/dev/null 2>&1 &<CR><CR>

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
