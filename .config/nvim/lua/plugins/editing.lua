return {
  colorscheme = { "catppuccin" },
  "tpope/vim-fugitive",
  -- "tpope/vim-surround",
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
  "Konfekt/vim-CtrlXA",
  "skywind3000/asyncrun.vim",

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
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
    -- event = "VeryLazy",
    -- enabled = false,
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>J" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({})
    end,
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
