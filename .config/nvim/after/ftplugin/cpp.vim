nnoremap <silent> <buffer> <CR> :vsplit term://make -C .. upload<CR>
nnoremap <silent> <buffer> <Backspace> :vert AsyncRun -mode=term -pos=right -save=2 make -C .. all<CR>
nnoremap <silent> <buffer> <F6> :vsplit term://make -C .. serial<CR>

