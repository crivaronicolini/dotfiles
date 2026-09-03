return {
  "norcalli/nvim-colorizer.lua",

  -- { "HawkinsT/pathfinder.nvim" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "julia" },
    },
  },

  -- {
  --   "Konfekt/vim-CtrlXA",
  --   keys = {
  --     { "<c-x>" },
  --     { "<c-a>" },
  --   },
  -- },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
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
        yaml = { "yamlfmt" },
        -- python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        -- python = { "black", "ruff_organize_imports" },
        html = { "oxfmt" },
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        go = { "gofmt" },
        json = { "jq" },
      },
    },
  },

  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
  },

  {
    "sindrets/diffview.nvim",
  },

  {
    "folke/sidekick.nvim",
    dir = "/home/marco/repos/sidekick.nvim",
    lazy = false,
    opts = {
      nes = {
        enabled = false,
      },
      copilot = {
        status = {
          enabled = false,
        },
      },
      cli = {
        context = {
          diagnostics_line = function(ctx)
            return require("sidekick.cli.context.diagnostics").get(ctx, { lnum = ctx.row - 1 })
          end,
        },
        prompts = {
          diagnostics_line = "Can you help me fix the diagnostic on the current line in {file}?\n{diagnostics_line}",
        },
        win = {
          config = function(terminal)
            if terminal.tool.name == "codex" then
              -- Keep Codex transcript lines intact in the terminal buffer and
              -- let Neovim perform the visual wrapping.
              terminal.opts.pty_width = 1000
              terminal.opts.wo.wrap = true
            end
          end,
          keys = {
            -- Disable Sidekick's default <C-p> binding in AI CLI/chat terminals.
            prompt = false,
          },
        },
      },
    },
  },

  -- {
  --   "nvim-mini/mini.diff",
  --   event = "VeryLazy",
  --   keys = {
  --     {
  --       "<leader>go",
  --       function()
  --         local diff = require("mini.diff")
  --         local current = diff.get_buf_data(0)
  --         local target_overlay = not (current and current.overlay)
  --
  --         for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  --           if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
  --             if not diff.get_buf_data(buf) then
  --               pcall(diff.enable, buf)
  --             end
  --
  --             local data = diff.get_buf_data(buf)
  --             if data and data.overlay ~= target_overlay then
  --               pcall(diff.toggle_overlay, buf)
  --             end
  --           end
  --         end
  --       end,
  --       desc = "Toggle mini.diff overlay all buffers",
  --     },
  --   },
  --   opts = {
  --     view = {
  --       style = "sign",
  --       signs = {
  --         add = "▎",
  --         change = "▎",
  --         delete = "",
  --       },
  --     },
  --   },
  -- config = function(_, opts)
  --   require("mini.diff").setup(opts)
  --
  --   local function set_minidiff_hl()
  --     local get_hl = vim.api.nvim_get_hl
  --     local set_hl = vim.api.nvim_set_hl
  --
  --     local diff_add = get_hl(0, { name = "DiffAdd", link = false })
  --     local diff_delete = get_hl(0, { name = "DiffDelete", link = false })
  --     local diff_change = get_hl(0, { name = "DiffChange", link = false })
  --     local added = get_hl(0, { name = "Added", link = false })
  --     local removed = get_hl(0, { name = "Removed", link = false })
  --     local changed = get_hl(0, { name = "Changed", link = false })
  --
  --     set_hl(0, "MiniDiffSignAdd", { fg = added.fg or "#a6e3a1" })
  --     set_hl(0, "MiniDiffSignChange", { fg = changed.fg or "#f9e2af" })
  --     set_hl(0, "MiniDiffSignDelete", { fg = removed.fg or "#f38ba8" })
  --
  --     set_hl(0, "MiniDiffOverAdd", { bg = diff_add.bg })
  --     set_hl(0, "MiniDiffOverDelete", { fg = removed.fg or "#f38ba8", bg = diff_delete.bg })
  --     set_hl(0, "MiniDiffOverContext", { fg = removed.fg or "#f38ba8", bg = diff_delete.bg })
  --     set_hl(0, "MiniDiffOverContextBuf", { bg = diff_add.bg })
  --     set_hl(0, "MiniDiffOverChange", { fg = removed.fg or "#f38ba8", bg = diff_change.bg })
  --     set_hl(0, "MiniDiffOverChangeBuf", { fg = added.fg or "#a6e3a1", bg = diff_change.bg })
  --   end
  --
  --   set_minidiff_hl()
  --   vim.api.nvim_create_autocmd("ColorScheme", {
  --     group = vim.api.nvim_create_augroup("UserMiniDiffHighlights", { clear = true }),
  --     callback = set_minidiff_hl,
  --   })
  -- end,
  -- },

  {
    "rashedInt32/lazydiff.nvim",
    keys = {
      {
        "<leader>go",
        "<cmd>Lazydiff<cr>",
        desc = "Toggle LazyDiff",
      },
    },
    cmd = {
      "Lazydiff",
      "LazydiffOff",
      "LazydiffRefresh",
      "LazydiffNext",
      "LazydiffPrev",
      "LazydiffFirst",
    },
    config = function()
      require("lazydiff").setup({
        ref = "HEAD", -- ref to diff the working tree against
        signs = {
          add = "+ ", -- prefix on added lines (inline virt_text)
          delete = "", -- prefix on virt_lines for deleted content
          context = "",
        },
        show_hunk_header = false, -- show "@@ -a,b +c,d @@" between hunks
        read_only = false, -- lock the buffer while overlay is on (off by default)
        auto_refresh = true, -- refresh on BufWritePost / FileChangedShellPost
        live_refresh = true, -- also refresh on TextChanged / TextChangedI
        debounce_ms = 100, -- debounce window for live refresh
        jump_on_enable = false, -- jump to the first hunk when toggling on
        nav = {
          wrap = true, -- ]h/[h wrap around at the last/first hunk
          center = true, -- center the cursor (zz) after jumping
        },
      })
    end,
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

  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Debug Continue",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Debug REPL",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last Debug",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate Debug",
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      local signs = {
        Breakpoint = "B",
        BreakpointCondition = "C",
        BreakpointRejected = "R",
        LogPoint = "L",
        Stopped = ">",
      }

      for name, text in pairs(signs) do
        vim.fn.sign_define("Dap" .. name, {
          text = text,
          texthl = "DiagnosticInfo",
          linehl = name == "Stopped" and "DapStoppedLine" or nil,
          numhl = name == "Stopped" and "DapStoppedLine" or nil,
        })
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Evaluate Expression",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        mode = "v",
        desc = "Evaluate Selection",
      },
      {
        "<leader>dw",
        function()
          require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
        end,
        desc = "Watch Word",
      },
      {
        "<leader>dw",
        function()
          local saved = vim.fn.getreg('"')
          vim.cmd.normal({ args = { "y" }, bang = true })
          local expr = vim.fn.getreg('"')
          vim.fn.setreg('"', saved)
          require("dapui").elements.watches.add(expr)
        end,
        mode = "v",
        desc = "Watch Selection",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "<leader>dm",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Python Test Method",
      },
      {
        "<leader>dM",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Python Test Class",
      },
      {
        "<leader>ds",
        function()
          require("dap-python").debug_selection()
        end,
        mode = "v",
        desc = "Debug Python Selection",
      },
    },
    config = function()
      local python = "python3"

      if vim.fn.exepath("debugpy-adapter") ~= "" then
        python = "debugpy-adapter"
      elseif vim.fn.executable("uv") == 1 then
        python = "uv"
      end

      require("dap-python").setup(python, {
        console = "integratedTerminal",
      })

      local function python_root()
        local path = vim.api.nvim_buf_get_name(0)
        path = path ~= "" and path or vim.uv.cwd()

        return vim.fs.root(path, {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          ".git",
        }) or vim.fn.getcwd()
      end

      require("dap").listeners.on_config["python-project-cwd"] = function(config)
        if (config.type == "python" or config.type == "debugpy") and not config.cwd then
          config.cwd = python_root()
        end

        return config
      end
    end,
  },
}
