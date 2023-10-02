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
vim.keymap.set("n", "gP", "P")

vim.keymap.set({ "x" }, "gp", '"_dP', { desc = "Paste to void reg" })

vim.keymap.set("n", "<c-n>", "*``cgn", { desc = "Replace Next" })
vim.keymap.set({ "n", "v" }, "<leader>r", ":s//g<Left><Left>", { desc = "Fast replace line" })
vim.keymap.set("n", "<leader>R", ":%s//g<Left><Left>", { desc = "Fast replace buffer" })

vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

vim.keymap.set({ "n", "x", "o" }, "n", "nzz", { desc = "Next search result" })

vim.cmd([[
    unmap H
    unmap L
]])

-- agarra la letra bajo el cursor y la vuelve a poner con tilde, es hermoso
vim.cmd([[
  nnoremap <silent> `` s<c-r>=tr(@", 'aeiounAEIOUNáéíóúñÁÉÍÓÚÑ','áéíóúñÁÉÍÓUÑaeiounAEIOUN')<cr><esc>
]])

-- lead s para arreglar el spell siguiente
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

vim.keymap.set("n", "<leader>p", ":pu +<cr>'[", { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", "d:-1pu +<cr>'[", { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<space>y", '"+y', { desc = "Yank to clipboard" })

vim.keymap.set("n", "yob", function()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end, { desc = "Toggle background" })
