"corta el undo tree en cada punto, asi no se borra todo con un u
" inoremap . .<c-g>u
" nnoremap <CR> :w<bar> AsyncRun! -silent pandoc <C-r>% -t beamer -o %:r.pdf --variable urlcolor=blue<CR>
" set filetype=beamer
" hi Conceal ctermfg=white
" setlocal commentstring=<!--\ %s\ -->

" noremap <buffer> <silent> k gk
" noremap <buffer> <silent> j gj
