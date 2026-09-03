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
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "tsgo", "ty" },
    },
    dependencies = {
      { "mason-org/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        copilot = { enabled = false },
        terraformls = {
          init_options = {
            indexing = {
              ignorePaths = { ".terraform/modules" },
            },
          },
          on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
          end,
        },
        marksman = {},
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts = opts or {}
      -- Mason's jdtls launcher defaults to a 1 GiB initial heap and leaves the
      -- maximum heap uncapped. Keep its indexer responsive without allowing a
      -- single Java project to exhaust system memory.
      opts.cmd = {
        vim.fn.exepath("jdtls"),
        "--jvm-arg=-Xms256m",
        "--jvm-arg=-Xmx1536m",
      }
      -- The intake backend is a nested Maven project (staging/bedard-java).
      -- Using the nearest pom.xml starts a second JDT LS for the child module;
      -- use the outermost enclosing Maven project so all its modules share one
      -- index and one language-server client.
      opts.root_dir = function(path)
        local pom = vim.fs.find("pom.xml", { path = path, upward = true })[1]
        if not pom then
          return vim.fs.root(path, vim.lsp.config.jdtls.root_markers)
        end

        local root = vim.fs.dirname(pom)
        while true do
          local parent_pom = vim.fs.find("pom.xml", {
            path = vim.fs.dirname(root),
            upward = true,
          })[1]
          if not parent_pom then
            return root
          end
          root = vim.fs.dirname(parent_pom)
        end
      end
      opts.jdtls = vim.tbl_deep_extend("force", opts.jdtls or {}, {
        cmd_env = {
          JAVA_HOME = "/usr/lib/jvm/java-25-openjdk",
          JDK_HOME = "/usr/lib/jvm/java-25-openjdk",
        },
      })
      return opts
    end,
  },
}
