return {
  colorscheme = { "catppuccin" },
  "norcalli/nvim-colorizer.lua",
  {
    "Konfekt/vim-CtrlXA",
    keys = {
      { "<c-x>" },
      { "<c-a>" },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  {
    "kylechui/nvim-surround",
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
    },
    version = "*",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gco" },
      { "gcO" },
      { "gcc" },
      { "gc" },
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup()
      local ft = require("Comment.ft")
      ft.pandoc = { "<!--%s-->", "<!--%s-->" }
      ft.astro = { "<!--%s-->", "<!--%s-->" }
    end,
  },
  --, "tpope/vim-surround",
  {
    -- "tummetott/unimpaired.nvim",
    -- config = function()
    --   require("unimpaired").setup({
    --     -- add any options here or leave empty
    --   })
    -- end,
    -- "tpope/vim-unimpaired",
    -- keys = {
    --   { "n", "]p", "<Plug>unimpaired-put-below", { desc = "unimpaired put below" } },
    -- },
  },

  -- {
  --   "chrisgrieser/nvim-spider",
  --   lazy = true,
  --   config = {
  --     vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" }),
  --     vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" }),
  --     vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" }),
  --     vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" }),
  --   },
  -- },

  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>J" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "ggandor/leap-spooky.nvim",
    },
    keys = {
      { "s", mode = { "n" }, desc = "Leap forward to" },
      { "S", mode = { "n" }, desc = "Leap backward to" },
      { "gs", mode = { "n" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      -- vim.keymap.del({ "x" }, "s")
      -- vim.keymap.del({ "x" }, "S")
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
}
