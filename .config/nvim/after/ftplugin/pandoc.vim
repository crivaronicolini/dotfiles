" nnoremap <silent> <buffer> <CR> :AsyncRun! -silent -save=2 pandoc -f markdown+hard_line_breaks <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
nnoremap <silent> <buffer> <CR> :AsyncRun! -silent -save=2 pandoc -f markdown <C-r>% --pdf-engine=pdflatex -o %:p:h/pdf/%:r.pdf --variable urlcolor=blue<CR>
" nnoremap <silent> <buffer> <backspace> :AsyncRun! -silent -save=2 pandoc -f markdown <C-r>% -s --highlight-style tango --mathjax --toc -o %:r.html<CR>
nnoremap <silent> <buffer> <backspace> :AsyncRun! -silent -save=2 ~/.pandoc/build-inline-html.sh <C-r>% %:r.html <cr>

" nn <F5> :w <bar>:!pweave -o %:r.md -f markdown %<CR>:!pandoc <C-r> %:r.md --pdf-engine=pdflatex -o  %:p:h/pdf/%:r.pdf<CR>
" autocmd BufWritePost * normal! mM
" nnoremap <silent> <buffer> <CR> :AsyncRun! -silent -save=2 pandoc --filter=pandoc-citeproc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>
" nnoremap <F5> :w<bar> AsyncRun!pandoc <C-r>% --pdf-engine=pdflatex -o %:r.pdf --variable urlcolor=blue<CR>

set wrap

" cambia la profundidad de item
nnoremap <silent> ]i :call <SID>ChangeItemLevel(1)<CR>
nnoremap <silent> [i :call <SID>ChangeItemLevel(-1)<CR>

" cambia la profundidad de seccion
nnoremap <silent> ]r :call <SID>ChangeSectionLevel(1)<CR>
nnoremap <silent> [r :call <SID>ChangeSectionLevel(-1)<CR>

nnoremap <leader>i :call <SID>PasteImg()<CR>
autocmd InsertLeave * if &readonly==0 && filereadable(bufname('%')) | silent update | endif

function! s:SetCheckFilename(dir)
    let l:filename = a:dir .. "/" .. input("Filename: ") .. ".png"
    if file_readable(l:filename)
        let l:choice = confirm("Another file with that name already exists.", "&Save as\n&Overwrite")
        if choice == 1
            let l:filename = s:SetCheckFilename(a:dir)
        endif
    return l:filename
    endif
endfunction

function! s:PasteImg() abort
    let l:dir = expand("%:p:h") .. "/imgs"
    if !isdirectory(dir)
        call mkdir(dir,"p")
    endif
    let l:filename = s:SetCheckFilename(dir)
    call system("guake --hide")
    call system("gnome-screenshot -a -f " .. filename)
    call system("guake --show")
    let l:line = "![](" .. filename .. "){width: 250px}"
    if getline('.') =~ '^\s*$'
        call append(".", "")
        call setline(".", line)
        exe "normal f]"
    else
        call append(".", "")
        call append(".", line)
        exe "normal jf]"
    endif
    startinsert
endfunction

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


" iabbrev <buffer> prob probabilidad
" iabbrev <buffer> exp experimento
" iabbrev <buffer> def definición
" iabbrev <buffer> conj conjunto
" iabbrev <buffer> sconj subconjunto


