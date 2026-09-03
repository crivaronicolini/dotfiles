return {
  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    priority = 1000,
    opts = {
      background = { dark = "mocha", light = "frappe" },
      integrations = {
        cmp = true,
        gitsigns = true,
        hop = true,
        mini = true,
        leap = true,
        markdown = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        vim_sneak = true,
        which_key = true,
        rainbow_delimiters = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
      },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin-nvim")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
