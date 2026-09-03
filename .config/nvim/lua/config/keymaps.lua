-- [[ keymaps ]]
vim.keymap.set("n", "<C-u>", "<C-R>", { desc = "Redo", noremap = true })

-- " manda esa linea al buffer anterior
-- nnoremap <leader>w yy<c-w>pgp<c-w>wj
-- " tnoremap <leader>w <Up><C-\><C-n>:sleep 100m<CR>02Wy$<c-w>po<Esc>gp<c-w>w
-- vnoremap <leader>w y<c-w>wo<Esc>gp<c-w>p

vim.keymap.set("n", "<leader>fd", ":<C-U>cd %:h<cr>:pwd<CR>", { desc = "cd to current's file location" })

vim.keymap.set("c", "<c-n>", "<down>")
vim.keymap.set("c", "<c-p>", "<up>")

vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-u>zz")

vim.keymap.set("n", "P", "$p")
vim.keymap.set("n", "gP", "P")

vim.keymap.set({ "x" }, "gp", '"_dP', { desc = "Paste to void reg" })

vim.keymap.set("n", "<c-n>", "*``cgn", { desc = "Replace Next" })
vim.keymap.set({ "n", "v" }, "<leader>r", ":s/\\v/g<Left><Left>", { desc = "Fast replace line" })
vim.keymap.set("n", "<leader>R", ":%s/\\v/g<Left><Left>", { desc = "Fast replace buffer" })

vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

vim.keymap.set({ "n", "x", "o" }, "n", "nzz", { desc = "Next search result" })

vim.keymap.set({ "n" }, "<space>gg", "<cmd>vert Git<cr>", { desc = "Git Fugitive" })

local git_changed_files = require("config.git_changed_files")
vim.keymap.set("n", "]g", git_changed_files.next, { desc = "Next git changed file" })
vim.keymap.set("n", "[g", git_changed_files.previous, { desc = "Previous git changed file" })

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

-- "deja hacer las cosas cuando tipeas rápido
vim.cmd([[
  cnoreabbrev W w
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev Wqa wqa
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev h vert h
]])

vim.cmd([[
tnoremap <C-h> <c-\><C-n><C-w>h
tnoremap <C-j> <c-\><C-n><C-w>j
tnoremap <C-k> <c-\><C-n><C-w>k
tnoremap <C-l> <c-\><C-n><C-w>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
]])

vim.cmd([[
  function! Do_math()
      " looks for equals sign, and sends the expression to qalc
      " appends the result to the line
      " test expression:
      " sin(0) +123.3- 2^3+cos(22*pi/180) = 
      let cursor = getcurpos()
      let expr = substitute(getline("."), "=.*", "", "")
      let result = system("qalc -t '" . expr . "'")[:-2]
      call append(".", result)
      normal! J
      call setpos('.', cursor)
  endfunction
  nnoremap <silent><leader>v :call Do_math()<CR>
]])

-- unimpaired trucho
vim.keymap.set("n", "]<space>", "o<esc>k", { desc = "Add blank line below" })
vim.keymap.set("n", "[<space>", "O<esc>j", { desc = "Add blank line above" })

vim.keymap.set("n", "ñ", "o<esc>", { desc = "Move to blank line below" })
vim.keymap.set("n", "Ñ", "O<esc>", { desc = "Move to blank line above" })

vim.keymap.set("n", "<leader>p", ":pu +<cr>'[", { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", "d:-1pu +<cr>'[", { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<space>y", '"+y', { desc = "Yank to clipboard" })

local function terminal_split(opts)
  return vim.tbl_deep_extend("force", opts or {}, {
    win = {
      relative = "win",
      position = "bottom",
    },
  })
end

local function snacks_terminal_job_id(buf)
  if buf and vim.api.nvim_buf_is_valid(buf) then
    return vim.b[buf].terminal_job_id
  end
end

local function find_visible_snacks_terminal()
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.bo[current_buf].filetype == "snacks_terminal" then
    return current_buf
  end

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "snacks_terminal" and vim.api.nvim_win_is_valid(win) then
      return buf, win
    end
  end
end

local function send_visual_selection_to_snacks_terminal()
  local buf, win = find_visible_snacks_terminal()
  local job_id = snacks_terminal_job_id(buf)
  if not job_id then
    vim.notify("No visible Snacks terminal", vim.log.levels.WARN)
    return
  end

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")
  local mode = vim.fn.visualmode()
  local start_row, start_col = start_pos[2], start_pos[3]
  local end_row, end_col = end_pos[2], end_pos[3]

  if start_row > end_row or (start_row == end_row and start_col > end_col) then
    start_row, end_row = end_row, start_row
    start_col, end_col = end_col, start_col
  end

  local lines
  if mode == "V" then
    lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  elseif mode == "\22" then
    lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    local left = math.min(start_col, end_col)
    local right = math.max(start_col, end_col)
    lines = vim.tbl_map(function(line)
      return line:sub(left, right)
    end, lines)
  else
    lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})
  end

  local text = table.concat(lines)
  if text == "" then
    vim.notify("No selection to send", vim.log.levels.WARN)
    return
  end

  vim.fn.chansend(job_id, text .. "\n")

  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)
    vim.cmd.startinsert()
  end
end

vim.keymap.set("n", "<leader>fT", function()
  Snacks.terminal(nil, terminal_split())
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal(nil, terminal_split({ cwd = LazyVim.root() }))
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set({ "n", "t" }, "<c-/>", function()
  Snacks.terminal.focus(nil, terminal_split({ cwd = LazyVim.root() }))
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set({ "n", "t" }, "<c-_>", function()
  Snacks.terminal.focus(nil, terminal_split({ cwd = LazyVim.root() }))
end, { desc = "which_key_ignore" })

vim.keymap.set("x", "<leader>tt", send_visual_selection_to_snacks_terminal, { desc = "Send to terminal" })
