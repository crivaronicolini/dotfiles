let g:neoterm_shell = '/usr/bin/fish'
" let g:neoterm_repl_python = ['ipython']
let g:neoterm_direct_open_repl = 1
let g:neoterm_auto_repl_cmd = 1
let g:neoterm_default_mod='vertical' " open terminal in bottom split
let g:neoterm_size=66 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

nnoremap <leader>w :TREPLSendLine<CR>j
vnoremap <leader>w :TREPLSendSelection<CR>
nnoremap <silent> <F6> :w <CR>oinclude("<Esc>:put=expand('%')<CR>A")<Esc>kJx<Esc>:TREPLSendLine<CR>u
nmap <leader>W vic:TREPLSendSelection<CR>``
map <silent> <F5> :w <bar> AsyncRun julia %<CR>

