call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'ggandor/leap.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'chentoast/marks.nvim'

Plug 'axvr/org.vim'
Plug 'normen/vim-pio'


" Plug 'Iron-E/nvim-highlite'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'ray-x/lsp_signature.nvim'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'leafOfTree/vim-svelte-plugin'
Plug 'mattn/emmet-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'NLKNguyen/papercolor-theme'
Plug 'dhruvasagar/vim-zoom'
Plug 'godlygeek/tabular'
Plug 'lambdalisue/suda.vim'

Plug 'fatih/vim-go'

Plug 'nvim-telescope/telescope.nvim'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'honza/vim-snippets',
Plug 'SirVer/ultisnips'
Plug 'dkarter/bullets.vim', {'for': 'pandoc'}
Plug 'AndrewRadev/inline_edit.vim', {'for': ['pandoc','tex']}
Plug '~/.config/nvim/plugged/marco-conceal.vim', {'for': ['tex', 'pandoc']}
Plug 'lervag/vimtex', {'for': 'tex'}

Plug 'voldikss/vim-floaterm'
" Plug 'justinmk/vim-sneak'
Plug 'skywind3000/asyncrun.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/goyo.vim'

Plug 'kassio/neoterm'
Plug 'roxma/nvim-yarp'
Plug 'mbbill/undotree'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tell-k/vim-autopep8'
Plug 'Konfekt/vim-CtrlXA'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'crivaronicolini/pydoc.vim', {'for':'python'}

Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim'
call plug#end()

set termguicolors

lua require('plugins')

" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'
" highlight link EchoDocFloat Pmenu

let autopep8_on_save = 0

filetype plugin indent on

let g:catppuccin_flavour = strftime("%H") > 5  && strftime("%H") < 18 ? "latte" : "macchiato"
colorscheme catppuccin

let g:vimtex_complete_bib = {'simple' : 1}
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1

let g:python3_host_prog = '/usr/bin/python3'

let g:tex_flavor = 'latex'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

let g:tex_conceal="abdgm"

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

"highligh de python en markdown
let g:markdown_fenced_languages = ['go', 'python']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python']
let g:pandoc#syntax#conceal#urls = 1
let g:bullets_enabled_file_types = ['pandoc', 'markdown', 'text', 'gitcommit']

let g:pydoc_perform_mappings = 0

let g:floaterm_opener='edit'

let g:float_preview#docked = 0

let g:Hexokinase_highlighters = ['backgroundfull']

let mapleader=" "

set ignorecase
set smartcase
set spellsuggest=7
set cul
set confirm
set linebreak
set breakindent
set noswapfile
set lazyredraw
set path+=**
set expandtab
set softtabstop=4
set shiftwidth=4
set scrolloff=12
set mouse=a
set completeopt-=preview
set completeopt+=menuone
set shortmess+=c
set wildmode=longest,full
set virtualedit=block
set wildignorecase
set splitright
set include=
set formatoptions=tcoqnj "default tcqj
set nonumber
set signcolumn=yes:1
set autowriteall

set undofile
set undodir^=/home/marco/.config/nvim/cache/undo
set backup
set backupdir^=/home/marco/.config/nvim/cache/backup

" sacados del vimrc de tom ryder (misc/tejr)
set nrformats+=alpha

"para que vim recuerde donde quedo
set shada='300,<100,:100,%,n~/.vim/shada

set makeprg="make"

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=100, on_visual=false}

"""""MAPPINGS"""""
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <leader>e :InlineEdit<cr>
xnoremap <leader>e :InlineEdit<cr>

nnoremap <tab> gt

nnoremap 'f <cmd>Telescope find_files<CR>
nnoremap 'g <cmd>Telescope git_files<CR>
nnoremap 'b <cmd>Telescope buffers<CR>
nnoremap 'l <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap 'h <cmd>Telescope oldfiles<CR>
nnoremap 's <cmd>Telescope Snippets<CR>
nnoremap '\ <cmd>Telescope live_grep<CR> 

tnoremap  <c-\><C-n>
" manda esa linea al buffer anterior
nnoremap <leader>w yy<c-w>pgp<c-w>wj
" tnoremap <leader>w <Up><C-\><C-n>:sleep 100m<CR>02Wy$<c-w>po<Esc>gp<c-w>w
vnoremap <leader>w y<c-w>wo<Esc>gp<c-w>p

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

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Window Resizing
nnoremap <silent><S-Right> :vertical resize +3<cr>
nnoremap <silent><S-Left> :vertical resize -3<cr>
nnoremap <silent><S-Down> :resize +3<cr>
nnoremap <silent><S-Up> :resize -3<cr>

nnoremap <Leader><Leader> <C-^>
nnoremap <silent><Leader>q :Bclose<CR>

"usa lead y d para copiar y pegar al portapapeles
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

"usa lead p para pegar
nmap <Leader>p :set paste<CR>o"+]p:set nopaste<CR>
nmap <Leader>P :set paste<CR>o"+]P:set nopaste<CR>
vmap <Leader>p :<C-u>set paste<CR>"+]p:<C-u>set nopaste<CR>
vmap <Leader>P :<C-u>set paste<CR>"+]P:<C-u>set nopaste<CR>

" busca la seleccion con / y abajo con ?
vmap * y:execute "/".escape(@",'[]/\.*')<CR>
" reemplaza la seleccion
vmap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>

"repite el ultimo macro
nnoremap Q @@

"changes directory to the current file's location
nnoremap <Leader>cc :<C-U>cd %:h<CR>:pwd<CR>

nnoremap <silent><Leader>C :let @+=expand('%:p:h')<CR>:echo "copied current filepath to clipboard"<CR>

" Lead u pone el UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>

"usa S para reemplazar
nnoremap <Leader>S :%s//g<Left><Left>
nnoremap <Leader>s :s//g<Left><Left>
vnoremap <Leader>s :s//g<Left><Left>

"abre y cierra goyo
nmap <F7> :Goyo<CR>

"abre quickfix
noremap <silent><F5> :call asyncrun#quickfix_toggle(8)<cr>

nnoremap <silent> <M-o> :FloatermNew lf<CR>

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
cnoreabbrev h vert h
cmap w!! w !sudo tee % >/dev/null

"usa H para buscar info con plugin better K y M para unir líneas
" nmap H <Plug>ShowPyDoc4
nnoremap <silent> H K<C-W>L
nnoremap M J

" que tal si en vez de eso uso ctrl k y j
noremap <C-F> <C-D>
noremap <C-B> <C-U>

"usa J y K para mover entre parrafos
nnoremap K 6k
nnoremap J 6j
vnoremap K 6k
vnoremap J 6j

"P es poner al final, recupero P con gP
nnoremap P $p
" lo mismo con V
" nnoremap vv V
" nnoremap V v$

"""""casi unimpaired"""""
"linea en blanco
nnoremap ñ o<Esc>
nnoremap Ñ O<Esc>
" mueve lineas, me gusta mas porque la veo moverse
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv
"vuelve a seleccionar cuando cambias la indentacion
vnoremap < <gv
vnoremap > >gv

" de VIMRC
nnoremap <C-r> :source $MYVIMRC<CR>
nnoremap <silent><leader>v :call Do_math()<CR>
vnoremap <silent><leader>v :call Do_math_v()<CR>
autocmd! BufWritePost $MYVIMRC source %
nnoremap <silent> 'V :edit $MYVIMRC<CR>
au Bufread $MYVIMRC nnoremap <buffer> gx :call Go_to_plugin_url()<CR>

nnoremap <silent> 'F :edit ~/.config/fish/config.fish<CR>
nnoremap <silent> 'T :edit ~/todo.md<CR>

"usa Ctrl-u para rehacer
noremap <C-u> <C-r>

" lead w para arreglar el spell siguiente
nnoremap <silent> <leader>t ]S1z=:spellr<CR>

" C-l para arreglar spells recien escritos
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"dice a que syntax group pertenece la palabra bajo el cursor
" nnoremap <silent> <leader>H :call SynGroup()<CR>
nnoremap <silent> <leader>H :TSHighlightCapturesUnderCursor<CR>

"F9 para repasar spelling
nnoremap <F9> :silent setlocal spell! spelllang=es<CR>

"agarra la letra bajo el cursor y la vuelve a poner con tilde, es hermoso
nnoremap <silent> `` s<c-r>=tr(@", 'aeiounAEIOUNáéíóúñÁÉÍÓÚÑ','áéíóúñÁÉÍÓUÑaeiounAEIOUN')<cr><esc>
                                   
"saca el highlight
" nnoremap <silent> <F4> :set nohlsearch<CR>
nnoremap <silent><expr> <F4> (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

"abre el archivo actual en pdf
nnoremap <leader>o :!zathura %:r.pdf >/dev/null 2>&1 &<CR><CR>
" nnoremap <leader>o :!zathura %:p:h/pdf/%:r.pdf >/dev/null 2>&1 &<CR><CR>

cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

vnoremap . :normal .<CR>

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

"pone marcas en el ultimo archivo visitado de esa extension
autocmd BufNewFile,BufReadPost *.pmd set filetype=pweave syntax=pweave
autocmd BufNewFile,BufReadPost *.md,*.bm set filetype=pandoc syntax=pandoc
autocmd BufNewFile,BufReadPost *.bm nnoremap <buffer> <CR> :w<bar> AsyncRun! -silent pandoc <C-r>% -t beamer -o %:r.pdf --variable urlcolor=blue<CR>

autocmd Filetype pweave map <F5> :w <bar>:!pweave -o %:r.md -f markdown %<CR>:!pandoc <C-r> %:r.md --pdf-engine=pdflatex -o  %:p:h/pdf/%:r.pdf<CR>

autocmd! Filetype neoterm set cursorline

"activa rainbow brakets para todo salvo help y neoterm
" autocmd WinEnter,BufEnter * if &filetype != "help" && &filetype != "neoterm"
" \ | call rainbow#load()
" \ | endif

" air-line
" if &background =='dark'
"     let g:airline_theme='solarized_flood'
" else
"     let g:airline_theme='cool'
" endif
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_y = '%{strftime("%H:%M")}'
" let g:airline_section_z = 'ln %l/%L'
" let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


" Make sure Vim returns to the same line when you reopen a file.
" augroup line_return
"     au!
"     au BufReadPost *
"         \ if line("'\"") > 0 && line("'\"") <= line("$") |
"         \     execute 'normal! g`"zvzz' |
"         \ endif
" augroup END

function! Do_math()
    " looks for equals sign, and sends the expression to qalc
    " appends the result to the line
    " test expression:
    " sin(0) +123.3- 2^3+cos(22*pi/180) = 
    let cursor = getcurpos()
    let expr = substitute(getline("."), "=.*", "", "")
    let result = system("qalc -t '" . expr . "'")[:-2]
    call append(".", result)
    normal! J
    call setpos('.', cursor)
endfunction

function! Do_math_v() range
    " looks for equals sign, and sends the expression to qalc
    " appends the result to the line
    " test expression:
    " sin(0) +123.3- 2^3+cos(22*pi/180) = 
    let cursor = getcurpos()
    let n = @n
    silent! normal gv"ny
    " echo "Word count:" . system("echo '" . @n . "' | wc -w")
    " call system("echo " . @n . "> /tmp/qalc")
    " let result = system("qalc -t -set 'decimal comma off'  '" . @n . "'")[:-2]
    call writefile(getreg('n',1,1) + ["\nsave definitions"], "/tmp/qalc")
    let result = system("qalc -t -f /tmp/qalc")[:-2]
    let @n = n
    call append("'>+1", split(result,'\n'))
    normal! '>
    " bonus: restores the visual selection
    " normal! gv   "

    " let cursor = getcurpos()
    " let expr = substitute(getline("."), "=.*", "", "")
    " let result = system("qalc -t '" . expr . "'")[:-2]
    " call append(".", result)
    " normal! J
    " call setpos('.', cursor)
    "
endfunction

function! Go_to_plugin_url()
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    let plug = matchstr(getline('.'), "'\\zs[^']\\+\\ze'")
    call netrw#BrowseX('https://github.com/' . plug, netrw#CheckIfRemote())
endfunction

fun! Whitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! Whitespace call Whitespace()
