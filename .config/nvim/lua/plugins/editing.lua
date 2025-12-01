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
    "numToStr/Comment.nvim",
    event = "VeryLazy",
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
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        python = { "ruff_format" },
      },
    },
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<leader><up>", function()
        mc.lineAddCursor(-1)
      end)
      set({ "n", "x" }, "<leader><down>", function()
        mc.lineAddCursor(1)
      end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>;", function()
        mc.matchAddCursor(1)
      end)
      set({ "n", "x" }, "<leader>:", function()
        mc.matchAddCursor(-1)
      end)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        layerSet("n", "<leader>a", mc.alignCursors)

        -- Add a cursor for all matches of cursor word/selection in the document.
        layerSet({ "n", "x" }, "<leader>A", mc.matchAllAddCursors)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
