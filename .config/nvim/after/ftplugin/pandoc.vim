"corta el undo tree en cada punto, asi no se borra todo con un u
inoremap . .<c-g>u
nnoremap <silent> <buffer> <CR> :AsyncRun! -silent -save=2 pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
autocmd BufWritePost * normal! mM
" nnoremap <silent> <buffer> <CR> :AsyncRun! -silent -save=2 pandoc --filter=pandoc-citeproc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
" nnoremap <F5> :w<bar> AsyncRun!pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
"setlocal commentstring=<!--\ %s\ -->
" call ( UltiSnipsAddFiletypes markdown )
setlocal cursorline

" cambia la profundidad de item
nnoremap <silent> ]i :call <SID>ChangeItemLevel(1)<CR>
nnoremap <silent> [i :call <SID>ChangeItemLevel(-1)<CR>

" cambia la profundidad de seccion
nnoremap <silent> ]r :call <SID>ChangeSectionLevel(1)<CR>
nnoremap <silent> [r :call <SID>ChangeSectionLevel(-1)<CR>

" -
    " -
function! s:ChangeItemLevel(dir) abort
    let l:pos = getcurpos()
    let l:curline = getline('.')
    " let l:firstchar = strcharpart(l:curline,0,1)
    " let l:secondchar = strcharpart(l:curline,1,1)
    let l:grupos = matchlist(l:curline,'^\( *\)\(-\?\)\( *\)\(.*\)')
    let l:currentLevel = len(l:grupos[1])/4
    let l:isItemized = len(l:grupos[2]) > 0
    let l:whitespaceAfter = l:grupos[3]
    let l:restOfLine = l:grupos[4]

    " if l:currentLevel >= 0 && l:isItemized==v:false
    "     if a:dir == 1
    "         let l:newLine = repeat(' ',l:currentLevel) . '- ' . l:restOfLine
    "     elseif a:dir == -1
    "         let l:newLine = l:restOfLine
    "         echom 'hola'
    "     endif
    " elseif l:currentLevel >= 0 && l:isItemized==v:true
    "     if a:dir == 1
    "         let l:newLine = repeat(' ',(l:currentLevel+1)*4) . '- ' . l:restOfLine
    "     elseif a:dir == -1
    "         let l:newLine = repeat(' ',(l:currentLevel-1)*4) . '- ' . l:restOfLine
    "     endif
    " endif


    if a:dir == 1
        if l:isItemized==v:false
            let l:mod = 0
            let l:suma = 2
        elseif l:isItemized==v:true
            let l:mod = 1
            let l:suma = 4
        endif
    elseif a:dir == -1
        if l:currentLevel == 0
            let l:newLine = l:restOfLine
            let l:mod = 2
            if  l:isItemized==v:true
                let l:suma = -2
            else
                let l:suma = 0
            endif
        elseif l:currentLevel > 0
            let l:mod = -1
            let l:suma = -4
        endif
    endif

    if l:mod <2
        let l:newLine = repeat(' ',(l:currentLevel+l:mod)*4) . '- ' . l:restOfLine
    endif

    " echom l:newLine
    call setline('.', l:newLine)

    let l:pos[2] += l:suma
    call setpos('.', l:pos)





"     if l:firstchar == '#'
"         if a:dir == 1
"             execute "normal! I#"
"             let l:pos[2] += 1
"         elseif a:dir == -1
"             if l:secondchar == ' '
"                 execute "normal! 0xx"
"                 let l:pos[2] -= 2
"             else
"                 execute "normal! 0x"
"                 let l:pos[2] -= 1
"             endif
"         endif
"     else
"         if a:dir == 1
"             execute "normal! gI# "
"             let l:pos[2] += 2
"         endif
"     endif
"     call setpos('.', l:pos)
endfunction


function! s:ChangeSectionLevel(dir) abort
    let l:pos = getcurpos()
    let l:curline = getline('.')
    let l:firstchar = strcharpart(l:curline,0,1)
    let l:secondchar = strcharpart(l:curline,1,1)
    if l:firstchar == '#'
        if a:dir == 1
            execute "normal! I#"
            let l:pos[2] += 1
        elseif a:dir == -1
            if l:secondchar == ' '
                execute "normal! 0xx"
                let l:pos[2] -= 2
            else
                execute "normal! 0x"
                let l:pos[2] -= 1
            endif
        endif
    else
        if a:dir == 1
            execute "normal! gI# "
            let l:pos[2] += 2
        endif
    endif
    call setpos('.', l:pos)
endfunction


iabbrev prob probabilidad
iabbrev exp experimento
iabbrev def definición
iabbrev conj conjunto
iabbrev sconj subconjunto


