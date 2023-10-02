return {

  -- markdown
  {
    "vim-pandoc/vim-pandoc-syntax",
    dependencies = {
      -- "SirVer/ultisnips",
      {
        "jbyuki/nabla.nvim",
        enabled = false,
        -- stylua: ignore
        keys = {
          { "<leader>cn", function() require("nabla").enable_virt() end, desc = "Notation rebuild" },
          { "<leader>cp", function() require("nabla").popup() end, desc = "Notation popup" },
        },
        config = function()
          require("nabla").enable_virt({
            autogen = true,
            -- silent = true,
          })
        end,
      },
      "jc-doyle/cmp-pandoc-references",
      -- "dkarter/bullets.vim",
    },
    ft = { "pandoc" },
    -- config = function()
    --   vim.bo.syntax = "pandoc"
    -- end,
  },

  -- python
  {
    "kassio/neoterm",
    ft = { "python", "julia" },
  },

  {
    "skywind3000/asyncrun.vim",
    ft = { "pandoc", "cpp", "python", "julia" },
  },
}
