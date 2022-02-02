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
nnoremap <silent> <F6> :w <CR>oinclude("<Esc>:put=expand('%')<CR>A")<Esc>kJx<Esc>:TREPLSendLine<CR>u
nmap <leader>W vic:TREPLSendSelection<CR>``
map <silent> <F5> :w <bar> AsyncRun julia %<CR>
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

nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

