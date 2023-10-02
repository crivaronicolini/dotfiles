let g:neoterm_shell = '/usr/bin/fish'
let g:neoterm_direct_open_repl = 0
let g:neoterm_auto_repl_cmd = 1
let g:neoterm_default_mod='vertical' " open terminal in bottom split
let g:neoterm_size=66 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_bracketed_paste=1

nnoremap <buffer> <leader>w :TREPLSendLine<CR>j
vnoremap <buffer> <leader>w :TREPLSendSelection<CR>
nnoremap <buffer> <CR> :TREPLSendFile<CR>
" nnoremap <silent> <Backspace> :w <CR>oinclude("<Esc>:put=expand('%')<CR>A")<Esc>kJJx<Esc>:TREPLSendLine<CR>
nnoremap <silent> <Backspace> :w :put='include("'. expand('%') . '")'<CR>A")<Esc>kJJx<Esc>:TREPLSendLine<CR>
nmap <leader>W vic:TREPLSendSelection<CR>``
nnoremap <buffer> <silent> <leader>W :call Send_par()<CR>
function! Send_par()
    let l:cursor = winsaveview()
    " normal! vapvap
    normal! "yyapvapvap
    execute('TREPLSendSelection')
    normal 
    " call setpos('.', cursor)
    call winrestview(cursor)
endfunction
