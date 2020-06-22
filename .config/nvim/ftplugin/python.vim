let g:kite_auto_complete=1
let g:kite_tab_complete=1


let g:pydoc_open_cmd = 'vsplit'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

let g:semshi#error_sign_delay = 2
let g:semshi#excluded_hl_groups = ['local']

let g:neoterm_shell = '/usr/bin/fish'
" let g:neoterm_repl_python = ['ipython']
let g:neoterm_direct_open_repl = 1
let g:neoterm_auto_repl_cmd = 1
let g:neoterm_default_mod='vertical' " open terminal in bottom split
let g:neoterm_size=66 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:asyncrun_open=8
let g:asyncrun_trim=1
let g:asyncrun_exit = 'silent call Ring_bell()'

set foldmethod=indent
set foldnestmax=2

"para hacer que el output de python se vea
let $PYTHONUNBUFFERED=1

autocmd BufWritePost *.py normal! mP

nnoremap <leader>w :TREPLSendLine<CR>j
vnoremap <leader>w :TREPLSendSelection<CR>
nnoremap <silent> <F6> :w <CR>orun <Esc>:put=expand('%:p')<CR>kJ<Esc>:TREPLSendLine<CR>u
nmap <leader>W vic:TREPLSendSelection<CR>``
nnoremap <Leader>v :call Go_pdb()<cr>
map <silent> <F5> :w <bar> AsyncRun python3 %<CR>
nmap <silent> <leader>rr :Semshi rename<CR>

nnoremap <leader>m :call Unmake_block()<CR>
xnoremap <leader>m :<c-u>call Make_block()<CR>

" functions
nmap <silent> <leader>e :Semshi goto error<CR>
nmap <silent> ]f :Semshi goto function next<CR>
nmap <silent> [f :Semshi goto function prev<CR>


call textobj#user#plugin('blocko',{
        \   'block':{
        \        '*sfile*': expand('<sfile>:p'),
        \        'select-a': 'ac',  '*select-a-function*': 's:select_a',
        \        'select-i': 'ic',  '*select-i-function*': 's:select_i'
        \      }
        \    })

function! s:select_a()
    let search = @/
    execute "normal! /# %%\<CR>"
    let end_pos = getpos('.')
    normal! N
    let start_pos = getpos('.')

    let @/ = search
    return ['V', start_pos, end_pos]
endfunction

function! s:select_i()
    let search = @/
    execute "normal! /# %%\<CR>k"
    let end_pos = getpos('.')
    normal! Nj
    let start_pos = getpos('.')
    let @/ = search
    return ['V', start_pos, end_pos]
endfunction


"abre el archivo en el debugger
function! Go_pdb()
    let a=expand('%')
    execute 'vsplit term://zsh'
    call chansend(b:terminal_job_id, 'ipython -m ipdb ' . a . "\n sticky \n")
    normal i
endfunction

"suena la campana de AsyncRun dependiendo el estado
function! Ring_bell()
    if g:asyncrun_status == 'success'
        silent call system('cvlc --play-and-exit ~/.vim/success_asyncrun.mp3 &')
    elseif g:asyncrun_status == 'failure'
        silent call system('cvlc --play-and-exit ~/.vim/error_asyncrun.mp3 &')
    endif
    clast
endfunction

function! Make_block() abort
" gracias a https://vi.stackexchange.com/questions/17606/vmap-and-visual-block-how-do-i-write-a-function-to-operate-once-for-the-entire
    normal :'<,'>s/# //
    let l:level = indent(line("'<"))
    let l:white = repeat(' ',level) . '"""'
    call append(line("'<")-1, white)
    call append(line("'>"), white)
endfunction

function! Unmake_block()
    let l:cursor = getcurpos()
    normal vaQ
    keepjumps normal gcdd
    keepjumps normal '>dd
    call setpos('.', cursor)
    keepjumps normal k
endfunction

function! Send_cell()
    let search = @/
    normal! /# %%<CR>
    normal! nkVNj
    " execute('TREPLSendSelection')
    " normal! ``k
    let @/ = search
endfunction

set errorformat=
    \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
    \%*\\sFile\ \"%f\"\\,\ line\ %l,



