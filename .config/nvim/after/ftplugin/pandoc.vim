"corta el undo tree en cada punto, asi no se borra todo con un u
inoremap . .<c-g>u
nnoremap <CR> :w<bar> AsyncRun!pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
" nnoremap <F5> :w<bar> AsyncRun!pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
hi Conceal ctermfg=white
setlocal commentstring=<!--\ %s\ -->
