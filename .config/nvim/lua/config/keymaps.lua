-- [[ keymaps ]]
vim.keymap.set("n", "<C-u>", "<C-R>", { desc = "Redo", noremap = true })

-- " manda esa linea al buffer anterior
-- nnoremap <leader>w yy<c-w>pgp<c-w>wj
-- " tnoremap <leader>w <Up><C-\><C-n>:sleep 100m<CR>02Wy$<c-w>po<Esc>gp<c-w>w
-- vnoremap <leader>w y<c-w>wo<Esc>gp<c-w>p

vim.keymap.set("n", "<leader>cc", ":<C-U>cd %:h<cr>:pwd<CR>", { desc = "cd to current's file location" })

vim.keymap.set("c", "<c-n>", "<down>")
vim.keymap.set("c", "<c-p>", "<up>")

vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-u>zz")

vim.keymap.set("n", "P", "$p")

vim.keymap.set({ "x" }, "gp", '"_dP', { desc = "Paste to void reg" })

vim.keymap.set({ "n", "v" }, "<leader>r", ":s//g<Left><Left>", { desc = "Fast replace line" })
vim.keymap.set("n", "<leader>R", ":%s//g<Left><Left>", { desc = "Fast replace buffer" })

vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- agarra la letra bajo el cursor y la vuelve a poner con tilde, es hermoso
vim.cmd([[
  nnoremap <silent> `` s<c-r>=tr(@", 'aeiounAEIOUNáéíóúñÁÉÍÓÚÑ','áéíóúñÁÉÍÓUÑaeiounAEIOUN')<cr><esc>
]])

-- lead x para arreglar el spell siguiente
vim.cmd([[
  nnoremap <silent> <leader>n ]S1z=:spellr<CR>
  nnoremap <silent> <leader>N [S1z=:spellr<CR>
]])

-- C-l para arreglar spells recien escritos
vim.cmd([[
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
]])

-- repite el . en la seleccion
vim.cmd([[
  vnoremap . :normal .<CR>
]])

-- busca la seleccion con *
vim.cmd([[
  vmap * y:execute "/".escape(@",'[]/\.*')<CR>
]])

-- "deja hacer las cosas cuando tipeas rápido
vim.cmd([[
  cnoreabbrev W w
  cnoreabbrev Wq wq
  cnoreabbrev Wqa wqa
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev h vert h
]])

-- unimpaired trucho
vim.keymap.set("n", "]<space>", "o<esc>k", { desc = "Add blank line below" })
vim.keymap.set("n", "[<space>", "O<esc>j", { desc = "Add blank line above" })

vim.keymap.set("n", "ñ", "o<esc>", { desc = "Move to blank line below" })
vim.keymap.set("n", "Ñ", "O<esc>", { desc = "Move to blank line above" })

vim.keymap.set("n", "gp", ":pu +<cr>", { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<space>y", '"+y', { desc = "Yank to clipboard" })

vim.keymap.set("n", "yob", function()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end, { desc = "Toggle background" })

-- vim.cmd([[
-- function! s:Map(...) abort
--   let [mode, head, rhs; rest] = a:000
--   let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
--   let tail = ''
--   let keys = get(g:, mode.'remap', {})
--   if type(keys) == type({}) && !empty(keys)
--     while !empty(head) && len(keys)
--       if has_key(keys, head)
--         let head = keys[head]
--         if empty(head)
--           let head = '<skip>'
--         endif
--         break
--       endif
--       let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
--       let head = substitute(head, '<[^<>]*>$\|.$', '', '')
--     endwhile
--   endif
--   if head !=# '<skip>' && empty(maparg(head.tail, mode))
--     return mode.'map ' . flags . ' ' . head.tail . ' ' . rhs
--   endif
--   return ''
-- endfunction
--
-- function! s:RestorePaste() abort
--   if exists('s:paste')
--     let &paste = s:paste
--     let &mouse = s:mouse
--     unlet s:paste
--     unlet s:mouse
--   endif
--   autocmd! unimpaired_paste
-- endfunction
--
-- function! s:SetupPaste() abort
--   let s:paste = &paste
--   let s:mouse = &mouse
--   set paste
--   set mouse=
--   augroup unimpaired_paste
--     autocmd!
--     autocmd InsertLeave * call s:RestorePaste()
--     if exists('##ModeChanged')
--       autocmd ModeChanged *:n call s:RestorePaste()
--     else
--       autocmd CursorHold,CursorMoved * call s:RestorePaste()
--     endif
--   augroup END
-- endfunction
--
-- nnoremap <silent> <Plug>unimpairedPaste :call <SID>SetupPaste()<CR>
-- nmap <script><silent> <Plug>(unimpaired-paste) :<C-U>call <SID>SetupPaste()<CR>
--
-- nmap <script><silent> <Plug>(unimpaired-enable)p  :<C-U>call <SID>SetupPaste()<CR>O
-- nmap <script><silent> <Plug>(unimpaired-disable)p :<C-U>call <SID>SetupPaste()<CR>o
-- nmap <script><silent> <Plug>(unimpaired-toggle)p  :<C-U>call <SID>SetupPaste()<CR>0C
--
-- " Section: Put
--
-- function! s:putline(how, map) abort
--   let [body, type] = [getreg(v:register), getregtype(v:register)]
--   if type ==# 'V'
--     exe 'normal! "'.v:register.a:how
--   else
--     call setreg(v:register, body, 'l')
--     exe 'normal! "'.v:register.a:how
--     call setreg(v:register, body, type)
--   endif
--   silent! call repeat#set("\<Plug>(unimpaired-put-".a:map.")")
-- endfunction
--
-- nnoremap <silent> <Plug>(unimpaired-put-above) :call <SID>putline('[p', 'above')<CR>
-- nnoremap <silent> <Plug>(unimpaired-put-below) :call <SID>putline(']p', 'below')<CR>
-- nnoremap <silent> <Plug>(unimpaired-put-above-rightward) :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>>']
-- nnoremap <silent> <Plug>(unimpaired-put-below-rightward) :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>>']
-- nnoremap <silent> <Plug>(unimpaired-put-above-leftward)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR><']
-- nnoremap <silent> <Plug>(unimpaired-put-below-leftward)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR><']
-- nnoremap <silent> <Plug>(unimpaired-put-above-reformat)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>=']
-- nnoremap <silent> <Plug>(unimpaired-put-below-reformat)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>=']
-- nnoremap <silent> <Plug>unimpairedPutAbove :call <SID>putline('[p', 'above')<CR>
-- nnoremap <silent> <Plug>unimpairedPutBelow :call <SID>putline(']p', 'below')<CR>
--
-- exe s:Map('n', '[p', '<Plug>(unimpaired-put-above)')
-- exe s:Map('n', ']p', '<Plug>(unimpaired-put-below)')
-- exe s:Map('n', '[P', '<Plug>(unimpaired-put-above)')
-- exe s:Map('n', ']P', '<Plug>(unimpaired-put-below)')
--
-- exe s:Map('n', '>P', "<Plug>(unimpaired-put-above-rightward)")
-- exe s:Map('n', '>p', "<Plug>(unimpaired-put-below-rightward)")
-- exe s:Map('n', '<P', "<Plug>(unimpaired-put-above-leftward)")
-- exe s:Map('n', '<p', "<Plug>(unimpaired-put-below-leftward)")
-- exe s:Map('n', '=P', "<Plug>(unimpaired-put-above-reformat)")
-- exe s:Map('n', '=p', "<Plug>(unimpaired-put-below-reformat)")
-- ]])
