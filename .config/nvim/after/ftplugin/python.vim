let g:pydoc_open_cmd = 'vsplit'
" nmap H <Plug>ShowPyDoc4

" let g:semshi#error_sign_delay = 2
" let g:semshi#excluded_hl_groups = ['local']

let g:neoterm_shell = '/usr/bin/fish'
let g:neoterm_repl_python = ['ipy']
let g:neoterm_direct_open_repl = 1
" let g:neoterm_auto_repl_cmd = 1
let g:neoterm_default_mod='vertical' " open terminal in bottom split
let g:neoterm_size=66 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_bracketed_paste=1

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:asyncrun_open=8
let g:asyncrun_trim=1
" let g:asyncrun_exit = 'silent call Ring_bell()'

if line('$')>300
    setlocal foldmethod=indent
    setlocal foldnestmax=2
endif

"para hacer que el output de python se vea
let $PYTHONUNBUFFERED=1

" autocmd BufWritePost *.py normal! mP
" autocmd BufWritePre *.py execute ':Semshi highlight'

nnoremap <buffer> <leader>w :TREPLSendLine<CR>j
vnoremap <buffer> <leader>w :TREPLSendSelection<CR>
" nnoremap <buffer> <silent> <CR> :w <CR>orun <Esc>:put=expand('%:p')<CR>kJ<Esc>:TREPLSendLine<CR>u
nnoremap <buffer> <CR> :TREPLSendFile<CR>
" nnoremap <buffer> <leader>W vap:TREPLSendSelection<CR>``
nnoremap <buffer> <silent> <leader>W :call Send_par()<CR>
" nnoremap <buffer> <Leader>v :call Go_pdb()<cr>
nnoremap <buffer> <silent> <F5> :AsyncRun -save=1 python3 %<CR>
nnoremap <buffer> <silent> <F17> :AsyncStop<CR>
nnoremap <buffer> <silent> <leader>rr :Semshi rename<CR>
nnoremap <buffer> <leader>m :call Send_cell()<CR>

nnoremap <buffer> <leader>M :call Unmake_block()<CR>
xnoremap <buffer> <leader>M :<c-u>call Make_block()<CR>

" " functions
" nmap <buffer> <silent> <leader>e :Semshi goto error<CR>
" nmap <buffer> <silent> ]f :Semshi goto function next<CR>
" nmap <buffer> <silent> [f :Semshi goto function prev<CR>
"
" nnoremap <silent> gh :call CocAction('doHover')<CR>

" call textobj#user#plugin('blocko',{
"         \   'block':{
"         \        '*sfile*': expand('<sfile>:p'),
"         \        'select-a': 'ac',  '*select-a-function*': 's:select_a',
"         \        'select-i': 'ic',  '*select-i-function*': 's:select_i'
"         \      }
"         \    })
"

" function! s:select_a()
"     let search = @/
"     execute "normal! /# %%\<CR>"
"     let end_pos = getpos('.')
"     normal! N
"     let start_pos = getpos('.')
"
"     let @/ = search
"     return ['V', start_pos, end_pos]
" endfunction

" function! s:select_i()
"     let search = @/
"     execute "normal! /# %%\<CR>k"
"     let end_pos = getpos('.')
"     normal! Nj
"     let start_pos = getpos('.')
"     let @/ = search
"     return ['V', start_pos, end_pos]
" endfunction


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
    execute('TREPLSendSelection')
    normal! ``k
    let @/ = search
endfunction

function! Send_par()
    let l:cursor = winsaveview()
    " normal! vapvap
    normal! "yyapvapvap
    execute('TREPLSendSelection')
    normal 
    " call setpos('.', cursor)
    call winrestview(cursor)
endfunction

set errorformat=
    \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
    \%*\\sFile\ \"%f\"\\,\ line\ %l,
