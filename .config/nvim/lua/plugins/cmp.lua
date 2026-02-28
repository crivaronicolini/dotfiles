return {
  {
    "kosayoda/nvim-lightbulb",
    dependencies = {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    },
    event = "VeryLazy",
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  {
    "yetone/avante.nvim",
    opts = {
      provider = "gemini",
      selection = {
        hint_display = "none",
      },
      behaviour = {
        auto_set_keymaps = false,
      },
    },
  },
}
