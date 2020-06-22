"""COLOR"""filetype plugin indent on
syntax enable
set background=dark
colorscheme PaperColor
"""""""""""

packadd! matchit
call plug#begin()
Plug 'AndrewRadev/inline_edit.vim', {'for': ['markdown','html','tex']}
Plug 'DanilaMihailov/vim-wiki-tips'
Plug 'etdev/vim-hexcolor'
Plug 'Stautob/vim-fish'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python' "af, ac
Plug 'thalesmello/vim-textobj-multiline-str' "aQ
Plug 'beloglazov/vim-textobj-quotes' "aq
Plug 'sgur/vim-textobj-parameter' "a,
Plug 'kana/vim-textobj-entire' "ae
Plug 'Julian/vim-textobj-variable-segment' "av

" Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips',
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'mhinz/neovim-remote', {'for': 'tex'}

Plug 'voldikss/vim-floaterm'
Plug 'rhysd/git-messenger.vim'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/goyo.vim'
" Plug 'autozimu/LanguageClient-neovim', {'branch':'next', 'do': 'bash install.sh',}
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-path'

Plug 'kassio/neoterm'
Plug 'roxma/nvim-yarp'
Plug 'felixhummel/setcolors.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'Konfekt/vim-CtrlXA'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'fs111/pydoc.vim', {'for': 'python'}

" utiles pero no da usarlos todo el tiempo
" Plug 'tpope/vim-unimpaired'
" Plug 'frazrepo/vim-rainbow'
Plug 'tweekmonster/startuptime.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'rstacruz/vim-coc-settings'
call plug#end()

"""""SETTINGS"""""
let g:python3_host_prog = '/home/marco/repos/miniconda3/bin/python'

"""""PLUGINS"""""
"""coc
let g:coc_global_extensions = ['coc-python']

" function! s:check_back_space() abort
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" if exists('*complete_info')
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
" imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
"""
call textobj#user#map('multilinestr', {
\   'python': {
\     'select-a': 'aQ',
\     'select-i': 'iQ',
\   }
\ })
let g:textobj_multilinestr_no_default_key_mappings = 1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:sneak#s_next = 1

"highligh de python en markdown
let g:markdown_fenced_languages = ['python']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python']

let g:rainbow_active = 1

let g:float_preview#docked = 0

let mapleader=" "

set hidden
set autowriteall
set number
set confirm
set linebreak
set incsearch
set noswapfile
set ttyfast
set lazyredraw
set noshowmode
set writebackup
set smartcase
" set path+=**
set breakindent
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
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
set wildmode=longest,full
set virtualedit=block,onemore
set wildignorecase  " Case insensitive, if supported
set splitright
set include=
set history=500
" Delete comment leaders when joining lines, if supported
set formatoptions+=j
" set formatoptions-=j
set nonumber
set signcolumn=yes:1
set autoread

set undolevels=500
set undofile
set undodir^=/home/marco/.vim/cache/undo
set backup
set backupdir^=/home/marco/.vim/cache/backup

set omnifunc=syntaxcomplete#Complete
" sacados del vimrc de tom ryder
" New windows go below or to the right of a split
set nrformats+=alpha
set grepprg=grep\ -HnRs\ --exclude='.git*'

"para que vim recuerde donde quedo
set shada='50,<100,:100,%,n~/.vim/shada

runtime macros/matchit.vim

"""""MAPPINGS"""""
" manda esa linea al buffer anterior
nnoremap <c-p> yy<c-w>pp<c-w>wj
tnoremap <c-p> <Up><C-\><C-n>:sleep 100m<CR>02Wy$<c-w>po<Esc>p<c-w>w
vnoremap <c-p> y<c-w>wo<Esc>p<c-w>p

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

"ir a ventana con C-direccion
tmap <C-j> <C-\><C-n><C-w>j
tmap <C-k> <C-\><C-n><C-w>k
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-l> <C-\><C-n><C-w>l

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Window Resizing
nmap <silent><S-Right> :vertical resize +3<cr>
nmap <silent><S-Left> :vertical resize -3<cr>
nmap <silent><S-Down> :resize +3<cr>
nmap <silent><S-Up> :resize -3<cr>

nnoremap <Leader><Leader> <C-^>
nnoremap <silent><Leader>b :b <C-d>
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

" busca la seleccion con / y abajo con ?
vmap / y:execute "/".escape(@",'[]/\.*')<CR>
vmap ? y:execute "?".escape(@",'[]/\.*')<CR>
" reemplaza la seleccion
vmap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>

"repite el ultimo macro
nnoremap Q @@

"changes directory to the current file's location
nnoremap <Leader>c :<C-U>cd %:h<CR>:pwd<CR>

nnoremap <silent><Leader>C :let @+=expand('%:p:h')<CR>

" Lead u pone el UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>

" \R reloads ~/.vimrc
nnoremap <silent> <Leader>R :<C-U>source $MYVIMRC<CR><CR>

" \? types :helpgrep for me ready to enter a search pattern
nnoremap <Leader>? :<C-U>helpgrep \c<S-Left>

"usa S para reemplazar
nnoremap <Leader>S :%s//g<Left><Left>
nnoremap <Leader>s :s//g<Left><Left>

"abre y cierra goyo
nmap <F7> :Goyo<CR>

"abre quickfix
noremap <silent><F3> :call asyncrun#quickfix_toggle(8)<cr>

"hv para help vertical
cabbr h vert h

nnoremap <silent> <leader>f :FloatermNew lf<CR>

"mi primer fncion, pone python a todos los bloques de texto de un .md
function! Fence_python()
    let l:save = winsaveview()
    let a=['','python']
    %s/```\zs/\=reverse(a)[0]/g
    call winrestview(save)
endfunction

nnoremap <Leader>x :call Fence_python()<cr>


"deja hacer las cosas cuando tipeas rápido
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa
cnoreabbrev Q q
cnoreabbrev Qa qa

"usa H para buscar info con plugin better K y M para unir líneas
nnoremap <silent> H K<C-W>L
nnoremap M J

" que tal si en vez de eso uso ctrl k y j
" nnoremap <C-m> <C-u> "esto cambia el enter, ups
nnoremap <C-n> <C-d>

"usa J y K para mover entre parrafos
nnoremap K 6k
nnoremap J 6j
vnoremap K 6k
vnoremap J 6j


"usa Y para copiar hasta el final de linea como D y A
nnoremap Y y$

"P es poner al final
" onoremap P $p

"""""casi unimpaired"""""
"linea en blanco
nnoremap ñ o<Esc>
nnoremap Ñ O<Esc>
" Cycle quickfix
nnoremap <silent>]C :cfirst<CR>
nnoremap <silent>]c :cnext<CR>
nnoremap <silent>[c :cprev<CR>
nnoremap <silent>[C :clast<CR>
" Cycle through buffers
nnoremap <silent>[B :bfirst<CR>
nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>
nnoremap <silent>]B :blast<CR>
" functions
" Cycle through locs
nnoremap <silent>[L :lfirst<CR>
nnoremap <silent>[l :lprevious<CR>
nnoremap <silent>]l :lnext<CR>
nnoremap <silent>]L :llast<CR>
" mueve lineas, me gusta mas porque la veo moverse
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv
"vuelve a seleccionar cuando cambias la indentacion
vnoremap < <gv
vnoremap > >gv

" de VIMRC
nnoremap <silent><leader>v :call Do_math()<CR>
autocmd! BufWritePost $MYVIMRC source %
nnoremap <silent> 'V :edit $MYVIMRC<CR>
au Bufread $MYVIMRC nnoremap <buffer> gx :call Go_to_plugin_url()<CR>

"usa Ctrl-u para rehacer
noremap <C-u> <C-r>

"dice a que syntax group pertenece la palabra bajo el cursor
nnoremap <silent> <leader>h :call SynGroup()<CR>

"F9 para repasar spelling
nnoremap <F9> :silent setlocal spell! spelllang=es,en<CR>

"agarra la letra bajo el cursor y la vuelve a poner con tilde, es hermoso
nnoremap <silent> ´ s<c-r>=tr(@", 'aeioucnAEIOUCNáéíóúçñÁÉÍÓÚÇÑ', 'áéíóúçñÁÉÍÓUÇÑaeioucnAEIOUCN')<cr><esc>

"saca el highlight
nnoremap <silent> <F4> :set nohlsearch<CR>

"abre el archivo actual en pdf
nnoremap <leader>o :!zathura %:r.pdf >/dev/null 2>&1 &<CR><CR>
" nnoremap <leader>o :!zathura %:p:h/pdf/%:r.pdf >/dev/null 2>&1 &<CR><CR>

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

"pone marcas en el ultimo archivo visitado de esa extension
autocmd BufWritePost *.css,*.less,*.scss        normal! mC
autocmd BufWritePost *.html                     normal! mH
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx      normal! mJ

"corta el undo tree en cada punto, asi no se borra todo con un u
" autocmd Filetype markdown, tex inoremap . .<c-g>u
"             \ inoremap ¿ `
"             \ map <F5> :!clear<CR><CR> :w<bar>!pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue -V geometry:margin=1in<CR>
" autocmd Filetype markdown,tex map <F5> :!clear<CR><CR> :w<bar>!pandoc <C-r>% --pdf-engine=pdflatex -o %:p:h/pdf/%:r.pdf --variable urlcolor=blue -V geometry:margin=1in<CR>

autocmd BufNewFile,BufReadPost *.pmd set filetype=pweave syntax=pweave
autocmd Filetype pweave map <F5> :w <bar>:!pweave -o %:r.md -f markdown %<CR>:!pandoc <C-r> %:r.md --pdf-engine=pdflatex -o  %:p:h/pdf/%:r.pdf<CR>



"activa rainbow brakets para todo salvo help y neoterm
" autocmd WinEnter,BufEnter * if &filetype != "help" && &filetype != "neoterm"
" \ | call rainbow#load()
" \ | endif

" air-line
let g:airline_theme='solarized_flood'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline_section_z = 'ln %l/%L'
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

function! Do_math()
    " evalua una expresion a la izquierda de un =,
    " y pone el resultado a la derecha
    " sin(0) +123.3- 2^3+cos(22*pi/180) = 116.227184
    let cursor = getcurpos()
    let expr = substitute(getline("."), "=", "", "")
    let result = system("mat '" . expr . "'")[:-2]
    call append(".", result)
    normal! J
    call setpos('.', cursor)
endfunction

function! Go_to_plugin_url()
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    let plug = matchstr(getline('.'), "'\\zs[^']\\+\\ze'")
    call netrw#BrowseX('https://github.com/' . plug, netrw#CheckIfRemote())
endfunction

