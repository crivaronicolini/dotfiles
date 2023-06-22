return {

  {
    "L3MON4D3/LuaSnip",
    -- event = "InsertEnter",

    -- stylua: ignore
    config = function ()
      local ls = require('luasnip')
      require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
      ls.setup {history=false,enable_autosnippets=true,}
      -- ls.add_snippets("all", { ls.s("ab", { ls.t("aber") }), },{ type = "autosnippets", key = "all_auto", })
    end,

    -- stylua: ignore
    keys = {

      {
        "<c-j>",
        function()
          local luasnip = require("luasnip")
          return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<c-j>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<c-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
      { "<c-f>", function() require("luasnip").next_choice() end, mode = { "i", "s" } },

      {
        "<tab>",
        function()
          local luasnip = require("luasnip")
          return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
      { "<c-f>", function() require("luasnip").next_choice() end, mode = { "i", "s" } },

    },
    -- keys = function()
    --   return {}
    -- end,
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
      "L3MON4D3/LuaSnip",
      -- "quangnguyen30192/cmp-nvim-ultisnips",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },

        -- snippet = {
        --   expand = function(args)
        --     luasnip.lsp_expand(args.body)
        --   end,
        -- },

        -- mapping = {
        --   ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        --   ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        --   ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        --   ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        --   ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        --   ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        --   ["<C-e>"] = cmp.mapping({
        --     i = cmp.mapping.abort(),
        --     c = cmp.mapping.close(),
        --   }),
        -- },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-j>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   if luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   elseif cmp.visible() then
          --     cmp.select_next_item()
          --   -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          --   -- they way you will only jump inside the snippet region
          --   elseif has_words_before() then
          --     cmp.complete()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),

          --   ["<S-Tab>"] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --       cmp.select_prev_item()
          --     elseif luasnip.jumpable(-1) then
          --       luasnip.jump(-1)
          --     else
          --       fallback()
          --     end
          --   end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "async_path" },
          { name = "buffer" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "pandoc_references" },
          -- { name = "path" },
          -- { name = "ultisnip" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
}
-- return{
--     {
--       'hrsh7th/nvim-cmp',
--       version = false,
--       event = "InsertEnter",
--       dependencies = {
--         'L3MON4D3/LuaSnip',
--         'saadparwaiz1/cmp_luasnip',
--         'rafamadriz/friendly-snippets',
--         'hrsh7th/cmp-nvim-lsp',
--         'hrsh7th/cmp-nvim-lsp-signature-help',
--         'hrsh7th/cmp-buffer',
--         'FelipeLema/cmp-async-path',
--         'hrsh7th/cmp-cmdline',
--         'quangnguyen30192/cmp-nvim-ultisnips',
--       },
--     opts = function()
--       local cmp = require("cmp")
--       local luasnip = require 'luasnip'
--       luasnip.config.setup {}
--       return {
--         -- completion = {
--         --   completeopt = "menu,menuone,noinsert",
--         -- },
--         snippet = {
--           expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--           ["<S-CR>"] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--           }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--           ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--           ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--         }),
--         sources = cmp.config.sources({
--           { name = 'nvim_lsp' },
--           { name = 'luasnip' },
--           { name = 'ultisnip' },
--           { name = 'buffer' },
--           { name = 'async_path' },
--           { name = 'pandoc_references' },
--           -- { name = 'buffer-lines' },
--           { name = 'nvim_lsp_signature_help' },
--         }),
--         formatting = {
--           format = function(_, item)
--             local icons = require("lazyvim.config").icons.kinds
--             if icons[item.kind] then
--               item.kind = icons[item.kind] .. item.kind
--             end
--             return item
--           end,
--         },
--         experimental = {
--           ghost_text = {
--             hl_group = "LspCodeLens",
--           },
--         },
--       }
--     end,
--   },
-- }
