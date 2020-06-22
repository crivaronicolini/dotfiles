autocmd BufNewFile,BufReadPost *.tex set filetype=tex syntax=tex
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

set conceallevel=2
let g:tex_conceal='abdmgs'
hi Conceal ctermfg=white

nmap <leader>lv  :VimtexView<CR>
" nmap <leader>lv  <plug>(vimtex-view)             
nmap <leader>lc  <plug>(vimtex-clean)            
nmap <leader>ll  :VimtexCompile<CR>
" nmap <leader>lm  <plug>(vimtex-imaps-list)       
nmap <leader>lx  <plug>(vimtex-reload)           
nmap <leader>li  <plug>(vimtex-info)             
nmap <leader>lt  <plug>(vimtex-toc-toggle)       
nmap <leader>lr  <plug>(vimtex-reverse-search)   
nmap <leader>le  <plug>(vimtex-errors)           
nmap <leader>lo  <plug>(vimtex-compile-output)   

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

autocmd BufWritePost * normal! mM
