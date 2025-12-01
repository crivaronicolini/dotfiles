return {
  -- {
  --   "L3MON4D3/LuaSnip",
  --   -- event = "InsertEnter",
  --   version = "v2.*",
  --   -- stylua: ignore
  --   config = function ()
  --     local ls = require('luasnip')
  --     require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
  --     ls.setup { enable_autosnippets=true,}
  --     -- ls.add_snippets("all", { ls.s("ab", { ls.t("aber") }), },{ type = "autosnippets", key = "all_auto", })
  --   end,

    -- stylua: ignore
    -- keys = {
    --   {
    --     "<c-j>",
    --     function()
    --       local luasnip = require("luasnip")
    --       return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>"
    --     end,
    --     expr = true, silent = true, mode = "i",
    --   },
    --   { "<c-j>", function() require("luasnip").jump(1) end, mode = "s" },
    --   { "<c-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    --
    --   {
    --     "<tab>",
    --     function()
    --       local luasnip = require("luasnip")
    --       return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>"
    --     end,
    --     expr = true, silent = true, mode = "i",
    --   },
    --   { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    --   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    --   { "<c-f>", function()
    --     local ls = require("luasnip")
    --       if ls.choice_active() then
    --         ls.change_choice(1)
    --       end
    --    end, mode = { "i", "s" } },
    --
    -- },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ruff_lsp = {
          mason = false,
          enabled = false,
        },
        -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
        basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "off",
              logLevel="Error",
          },
          disableTaggedHints = true,
          capabilities = {
            textDocument = {
              publishDiagnostics = {
                tagSupport = {
                  valueSet = { 1 },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      cmp.setup({
        formatting = {
          format = require("tailwindcss-colorizer-cmp").formatter,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- Manually trigger a completion from nvim-cmp.
          ["<C-Space>"] = cmp.mapping.complete({}),

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "async_path" },
          { name = "buffer" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "pandoc_references" },
          { name = "emoji" },
          -- { name = "path" },
          -- { name = "ultisnip" },
        }),
        -- formatting = {
        --   format = function(_, item)
        --     local icons = require("lazyvim.config").icons.kinds
        --     if icons[item.kind] then
        --       item.kind = icons[item.kind] .. item.kind
        --     end
        --     return item
        --   end,
        -- },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      })
    end,
  },

  -- { -- Autoformat
  --   "stevearc/conform.nvim",
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = {
  --       timeout_ms = 500,
  --       lsp_fallback = true,
  --     },
  --     formatters_by_ft = {
  --       lua = { "stylua" },
  --       go = { "gofmt" },
  --       -- html = { "prettier" },
  --       --
  --       -- You can use a sub-list to tell conform to run *until* a formatter
  --       -- is found.
  --       -- javascript = { { "prettierd", "prettier" } },
  --     },
  --   },
  -- },

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
}
