vim.o.clipboard = ""
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.spellsuggest = "7"
vim.opt.spelllang = { "es", "en" }
vim.o.cul = true
vim.o.confirm = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.lazyredraw = true
vim.opt.path:append({ "**" })
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.scrolloff = 12
vim.o.mouse = "a"
vim.o.completeopt = "menuone,noselect"
vim.opt.wildmode = { "longest", "full" }
vim.o.virtualedit = "block"
vim.o.wildignorecase = true
vim.o.splitright = true
vim.o.splitbelow = false
vim.o.number = false
vim.o.relativenumber = false
vim.wo.signcolumn = "yes"
vim.o.autowriteall = true

vim.o.shada = "'300,<100,:100,%"
vim.o.undofile = true
vim.o.swapfile = false

vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.termguicolors = true

local time = os.date("*t")
if 8 <= time.hour and time.hour < 17 then
  print(time.hour)
  vim.o.background = "light"
else
  vim.o.background = "dark"
end
vim.g.snacks_animate = false
