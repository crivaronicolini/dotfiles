_G.__close_snacks_lazygit = function()
  for _, terminal in ipairs(Snacks.terminal.list()) do
    local data = vim.b[terminal.buf].snacks_terminal
    local cmd = data and data.cmd

    if type(cmd) == "table" and cmd[1] == "lazygit" then
      terminal:hide()
      return
    end
  end
end

local close_lazygit = " && nvim --server \"$NVIM\" --remote-expr 'v:lua.__close_snacks_lazygit()'"

return {
  {
    "HiPhish/rainbow-delimiters.nvim",
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
    },
  },

  {
    "crivaronicolini/lf.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "nvim-lua/plenary.nvim" },
    opts = { winblend = 0, border = "rounded" },
    config = function(_, opts)
      require("lf").setup(opts)

      local ok, lf_main = pcall(require, "lf.main")
      if not ok then
        return
      end

      local uv = vim.uv or vim.loop

      if not lf_main.__pathless_buffer_fix_applied then
        local spawn_cwd = vim.env.PWD or uv.cwd()

        local function normalize_dir(path)
          if type(path) ~= "string" or path == "" then
            return nil
          end

          path = vim.fn.fnamemodify(vim.fn.expand(path), ":p")
          local stat = uv.fs_stat(path)
          if type(stat) == "table" and stat.type == "directory" then
            return path
          end
        end

        local function fallback_dir()
          for _, path in ipairs({ spawn_cwd, uv.cwd(), vim.fn.getcwd(), vim.env.HOME }) do
            local dir = normalize_dir(path)
            if dir then
              return dir
            end
          end
          return "/"
        end

        function lf_main:__open_in(path)
          local fs = require("lf.utils").fs
          if path == "gwd" or path == "git_dir" then
            path = require("lf.utils").git_dir()
          end
          path = vim.fn.expand((path == "" or path == nil) and "%:p:h" or path)

          local built = path
          local stat = uv.fs_stat(path)
          if type(stat) ~= "table" then
            local cwd = fallback_dir()
            stat = uv.fs_stat(cwd)
            built = cwd
          end

          if stat and stat.type ~= "directory" then
            built = fs.dirname(built)
          end

          self.term.dir = normalize_dir(built) or fallback_dir()
          self.curfile = vim.fn.expand("%:p")

          return self
        end

        lf_main.__pathless_buffer_fix_applied = true
      end

      if not lf_main.__argv_realpath_fix_applied then
        function lf_main:__set_argv()
          local args = {}

          for _, arg in ipairs(vim.fn.argv()) do
            if vim.api.nvim_buf_is_loaded(vim.fn.bufnr(arg)) then
              local realpath = uv.fs_realpath(arg)
              if realpath then
                table.insert(args, realpath)
              end
            end
          end

          self.arglist = args
        end

        lf_main.__argv_realpath_fix_applied = true
      end
    end,
    keys = { { "<M-o>", "<cmd>Lf<cr>", "Open Lf file exp" } },
  },

  {
    "chentoast/marks.nvim",
    enabled = false,
    event = "BufReadPost",
    opts = { default_mappings = true, signs = true },
  },

  {
    "folke/zen-mode.nvim",
    opts = { backdrop = 1, twilight = { enabled = true } },
    keys = { "<leader>uz", "<cmd>ZenMode<cr>" },
    config = function()
      vim.keymap.set("n", "<leader>uz", ":ZenMode<CR>")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        refresh = { statusline = 100 },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      picker = {
        hidden = true,
        ignored = true,
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      lazygit = {
        config = {
          os = {
            editPreset = "",
            edit = 'nvim --server "$NVIM" --remote {{filename}}' .. close_lazygit,
            editAtLine = 'nvim --server "$NVIM" --remote +{{line}} {{filename}}' .. close_lazygit,
            editAtLineAndWait = 'nvim --server "$NVIM" --remote +{{line}} {{filename}}' .. close_lazygit,
            editInTerminal = false,
            openDirInEditor = 'nvim --server "$NVIM" --remote {{dir}}' .. close_lazygit,
          },
        },
        win = {
          position = "float",
        },
      },
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "**/.git/*",
              "**/.venv/*",
              "**/node_modules/*",
              "**/target/*",
            },
          },
        },
      },
    },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
}
