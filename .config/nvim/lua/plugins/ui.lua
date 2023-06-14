return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
    },
  },

  {
    "lmburns/lf.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "nvim-lua/plenary.nvim" },
    opts = { winblend = 0, border = "rounded" },
    keys = { { "<M-o>", "<cmd>Lf<cr>", "Open Lf file exp" } },
  },

  {
    "chentoast/marks.nvim",
    opts = { default_mappings = true, signs = true },
  },

  {
    "folke/zen-mode.nvim",
    opts = { backdrop = 1, twilight = { enabled = true } },
    keys = { "<F7>", "<cmd>ZenMode<cr>" },
    config = function()
      vim.keymap.set("n", "<F7>", ":ZenMode<CR>")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
        refresh = { statusline = 100 },
      },
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    -- dependencies = {
    --   "debugloop/telescope-undo.nvim",
    -- },
    -- config = function()
    --   require("telescope").setup({
    --     extensions = { undo = {} },
    --   })
    --   require("telescope").load_extension("undo")
    -- end,
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true ignore_current_buffer=true sort_mru=true<cr>",
        desc = "Switch Buffer",
      },
      { "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Telescope undo" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = { mode = "topline" },
      },
    },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
}
