setlocal noexpandtab tabstop=4 shiftwidth=4 
set formatoptions=tcroq1jb
let g:go_doc_keywordprg_enabled=0
nnoremap K 6k
" nnoremap H K
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
" setlocal keywordprg=:GoDoc

nnoremap <silent> H :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
