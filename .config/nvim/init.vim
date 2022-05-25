call plug#begin()

Plug 'chentau/marks.nvim'

Plug 'axvr/org.vim'
Plug 'normen/vim-pio'

Plug 'Neevash/awesome-flutter-snippets'
Plug 'akinsho/flutter-tools.nvim'

Plug 'Th3Whit3Wolf/one-nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'L3MON4D3/LuaSnip'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'ray-x/lsp_signature.nvim'

Plug '~/.config/nvim/plugged/nvim-highlite'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
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
Plug 'godlygeek/tabular',
Plug 'lambdalisue/suda.vim'

Plug 'fatih/vim-go'

Plug 'nvim-telescope/telescope.nvim'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'


" Plug 'DanilaMihailov/vim-wiki-tips'
" Plug 'chrisbra/Colorizer'
" Plug 'Stautob/vim-fish'
" Plug 'kana/vim-textobj-user'
" Plug 'bps/vim-textobj-python' "af, ac
" Plug 'thalesmello/vim-textobj-multiline-str' "aQ
" Plug 'beloglazov/vim-textobj-quotes' "aq
" Plug 'sgur/vim-textobj-parameter' "a,
" Plug 'kana/vim-textobj-entire' "ae
" Plug 'Julian/vim-textobj-variable-segment' "av

" Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-pandoc/vim-pandoc-syntax'



Plug 'honza/vim-snippets',
Plug 'SirVer/ultisnips'
Plug 'dkarter/bullets.vim', {'for': 'pandoc'}
Plug 'AndrewRadev/inline_edit.vim', {'for': ['pandoc','tex']}
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex', 'pandoc']}
Plug '~/.config/nvim/plugged/marco-conceal.vim', {'for': ['tex', 'pandoc']}
Plug 'lervag/vimtex', {'for': 'tex'}
" Plug 'mhinz/neovim-remote', {'for': 'tex'}

Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-sneak'
" Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/goyo.vim'

Plug 'kassio/neoterm'
Plug 'roxma/nvim-yarp'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tell-k/vim-autopep8'
Plug 'Konfekt/vim-CtrlXA'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'crivaronicolini/pydoc.vim', {'for':'python'}

" utiles pero no da usarlos todo el tiempo
Plug 'tpope/vim-unimpaired'
" Plug 'frazrepo/vim-rainbow'
Plug 'tweekmonster/startuptime.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-snippets'
" Plug 'rstacruz/vim-coc-settings'
call plug#end()

set termguicolors

lua <<EOF
require('Comment').setup()
require('gitsigns').setup()
require'colorizer'.setup(nil, { css = true; })
require "lsp_signature".setup({floating_window=false})

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
--
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{cmd={"/home/marco/.npm-packages/bin/pyright-langserver", "--stdio" }, on_attach=on_attach}
require'lspconfig'.vimls.setup{cmd={"/home/marco/.npm-packages/bin/vim-language-server", "--stdio" }, on_attach=on_attach}
require'lspconfig'.julials.setup{ on_attach=on_attach, capabilities=capabilities}
require'lspconfig'.svelte.setup{cmd={"/home/marco/.npm-packages/bin/svelteserver","--stdio" }, on_attach=on_attach, capabilities=capabilities}
-- require'lspconfig'.ccls.setup{on_attach=on_attach, capabilities=capabilities}
require'lspconfig'.clangd.setup{on_attach=on_attach, capabilities=capabilities}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python","julia",
    "svelte","javascript","lua","latex","bibtex","json","html","go","fish","css","cmake","bash","vim","cpp"},
    sync_install = false,
    highlight = { enable = true, },
    refactor = { highlight_definitions = { enable = true }, },
    textobjects = {
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["i,"] = "@parameter.inner",
          ["a,"] = "@parameter.outer",
    },
  },
},
}

-- local luasnip = require'luasnip'

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
      -- require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- ['<Tab>'] = function(fallback)
    --   if luasnip.expand_or_jumpable() then
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
    --   elseif cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
    --   if luasnip.jumpable(-1) then
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
    --   elseif cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'luasnip' }, -- For ultisnips users.
    { name = 'buffer' },
    { name = 'path' },
  }, {
  })
})


require("flutter-tools").setup{} -- use defaults
-- require("luasnip.loaders.from_vscode").load()
-- require("luasnip.loaders.from_snipmate").load()
-- require("luasnip.loaders.from_vscode").load({paths={"./plugged/awesome-flutter-snippets"}})

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
--
-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['vimls'].setup { capabilities = capabilities }
-- require('lspconfig')['pyright'].setup { capabilities = capabilities }
EOF

" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'
" highlight link EchoDocFloat Pmenu

let autopep8_on_save = 0

filetype plugin indent on
" syntax enable

if &term == 'xterm-kitty'
    hi Normal ctermbg=None
    hi SignColumn ctermbg=None
else
    set background=dark
" set background=light
endif

colorscheme neopapercolor
let &background =strftime("%H") > 5  && strftime("%H") < 20 ? "light" : "dark"


let g:vimtex_complete_bib = {'simple' : 1}
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1

let g:python3_host_prog = '/usr/bin/python3'


" let g:coc_global_extensions = ['coc-python', 'coc-go']

let g:tex_flavor = 'latex'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" call textobj#user#map('multilinestr', {
" \   'python': {
" \     'select-a': 'aQ',
" \     'select-i': 'iQ',
" \   }
" \ })
" let g:textobj_multilinestr_no_default_key_mappings = 1
"
let g:tex_conceal="abdgm"
" let g:tex_conceal_frac = M

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

let g:sneak#s_next = 1

"highligh de python en markdown
let g:markdown_fenced_languages = ['go', 'python']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python']
let g:pandoc#syntax#conceal#urls = 1
let g:bullets_enabled_file_types = ['pandoc', 'markdown', 'text', 'gitcommit']

let g:pydoc_perform_mappings = 0
" let g:neoterm_automap_keys = 0

let g:rainbow_active = 1

let g:floaterm_opener='edit'

let g:float_preview#docked = 0

let mapleader=" "

let g:Hexokinase_highlighters = ['backgroundfull']
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


au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=100, on_visual=false}

"""""MAPPINGS"""""
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" nnoremap ; :
" nnoremap : ;

nnoremap <leader>e :InlineEdit<cr>
xnoremap <leader>e :InlineEdit<cr>
" inoremap <c-e> <esc>:InlineEdit<cr>a


" nnoremap <tab> gt

"""FZF"""
autocmd! FileType fzf tnoremap <Esc> <C-c>

nnoremap 'f <cmd>Telescope find_files<CR>
nnoremap 'g <cmd>Telescope git_files<CR>
nnoremap 'b <cmd>Telescope buffers<CR>
nnoremap 'l <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap 'h <cmd>Telescope oldfiles<CR>
nnoremap 's <cmd>Telescope Snippets<CR>
nnoremap '\ <cmd>Telescope live_grep<CR> 

" nnoremap 'f :Files<CR>
" nnoremap 'g :GFiles<CR>
" nnoremap 'b :Buffers<CR>
" nnoremap 'l :Lines<CR>
" nnoremap 'h :History<CR>
" nnoremap 's :Snippets<CR>
" nnoremap '\ :Rg 
"
source ~/.config/nvim/bookmarks.vim
source ~/.config/nvim/letrasgriegas.vim

tnoremap  <c-\><C-n>
" manda esa linea al buffer anterior
nnoremap <leader>w yy<c-w>pgp<c-w>wj
" tnoremap <leader>w <Up><C-\><C-n>:sleep 100m<CR>02Wy$<c-w>po<Esc>gp<c-w>w
vnoremap <leader>w y<c-w>wo<Esc>gp<c-w>p

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
nnoremap <C-r> :source $MYVIMRC<CR>:AirlineRefresh<CR>
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
if &background =='dark'
    let g:airline_theme='solarized_flood'
else
    let g:airline_theme='cool'
endif
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline_section_z = 'ln %l/%L'
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


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
