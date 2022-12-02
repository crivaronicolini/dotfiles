require'lsp_signature'.setup({ floating_window = false })
require'colorizer'.setup(nil, { css = true; })
require'Comment'.setup({})
require'treesitter-context'.setup { mode = 'topline' }
require'nvim-surround'.setup()
require'hop'.setup()

require'marks'.setup {
    default_mappings = true,
    signs = true,
    mappings = {}
}

require'lualine'.setup({
    options = {
        theme = 'catppuccin',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
        refresh = { statusline = 100, },
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            {
            'diagnostics',
                sources = { 'nvim_lsp' },
                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                  -- Same values as the general color option can be used here.
                  error = 'DiagnosticError', -- Changes diagnostics' error color.
                  warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                  info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                  hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
        }
        },
        lualine_c = { { 'filename', path = 1 } },
        lualine_z = { { 'location', 'g:asyncrun_status' } }
    },
    extensions = {'fugitive'},
})

require'gitsigns'.setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
})


require'lspconfig'
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


end

local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup { cmd = { '/home/marco/.npm-packages/bin/pyright-langserver', '--stdio' }, on_attach = on_attach }
require'lspconfig'.vimls.setup { cmd = { '/home/marco/.npm-packages/bin/vim-language-server', '--stdio' }, on_attach = on_attach }
require'lspconfig'.julials.setup { on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.svelte.setup { cmd = { '/home/marco/.npm-packages/bin/svelteserver', '--stdio' }, on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.clangd.setup { on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.eslint.setup { on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require'lspconfig'.sumneko_lua.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})


require'nvim-treesitter.configs'.setup({
    ensure_installed = { 'python', 'julia', 'svelte', 'javascript', 'lua', 'latex', 'bibtex', 'json', 'html', 'go', 'rust',
        'fish', 'css', 'cmake', 'bash', 'vim', 'cpp' },
    sync_install = false,
    highlight = { enable = true, },
    refactor = { highlight_definitions = { enable = true }, },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['i,'] = '@parameter.inner',
                ['a,'] = '@parameter.outer',
            },
        },
    },
})


local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
            -- require'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'buffer' },
        { name = 'path' },
    }, {
    })
})



require'catppuccin'.setup({
    integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dashboard = false,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = true,
        hop = false,
        leap = true,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        markdown = true,
        mini = false,
        neogit = false,
        notify = false,
        nvimtree = false,
        overseer = false,
        symbols_outline = false,
        telekasten = false,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = true,
        vimwiki = false,
        which_key = false,
        -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
        dap = {
            enabled = false,
            enable_ui = false,
        },
        indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { 'italic' },
                hints = { 'italic' },
                warnings = { 'italic' },
                information = { 'italic' },
            },
            underlines = {
                errors = { 'underline' },
                hints = { 'underline' },
                warnings = { 'underline' },
                information = { 'underline' },
            },
        },
        navic = {
            enabled = false,
            custom_bg = 'NONE',
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
    },
})

vim.api.nvim_create_autocmd('OptionSet', {
    pattern = 'background',
    callback = function()
        vim.cmd('Catppuccin ' .. (vim.v.option_new == 'light' and 'latte' or 'mocha'))
    end,
})
