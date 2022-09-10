let command = ':vert AsyncRun -cwd=<root> -mode=term -pos=right -save=2 '
nnoremap <silent> <buffer> <Backspace> :exec command . 'make all'<CR>
nnoremap <silent> <buffer> <CR> :exec command . 'make upload'<CR> 
nnoremap <silent> <buffer> <F6> :exec command . 'make serial'<CR>

