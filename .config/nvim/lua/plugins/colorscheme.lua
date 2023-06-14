return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = { dark = "mocha", light = "frappe" },
      integrations = {
        cmp = true,
        gitsigns = true,
        hop = true,
        leap = true,
        markdown = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        vim_sneak = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
      },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
