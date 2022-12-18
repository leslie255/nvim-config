local M = {}

function M.config()
    -- Setup nvim-cmp.
    local cmp = require 'cmp'
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- luasnip
                require('luasnip').lsp_expand(args.body)
                -- vsnip
                -- vim.fn["vsnip#anonymous"](args.body)
                -- snippy
                -- require('snippy').expand_snippet(args.body)
                -- ultisnip
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- Accept currently selected item...
            -- Set `select` to `false` to only confirm explicitly selected items:
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, { { name = 'buffer' } })
    })

    -- You can also set special config for specific filetypes:
    --    cmp.setup.filetype('gitcommit', {
    --        sources = cmp.config.sources({
    --            { name = 'cmp_git' },
    --        }, {
    --            { name = 'buffer' },
    --        })
    --    })

    -- nvim-cmp for commands
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")

    cmp.setup({

        mapping = {

            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            -- ... Your other mappings ...
        },

        -- ... Your other configuration ...
    })

    -- nvim-lspconfig config
    -- List of all pre-configured LSP servers:
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local servers = { 'clangd', 'rust_analyzer', 'pylsp', 'sumneko_lua', 'sourcekit' }
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {}
    end

    local devicons = require('nvim-web-devicons')
    cmp.register_source('devicons', {
        complete = function(_, _, callback)
            local items = {}
            for _, icon in pairs(devicons.get_icons()) do
                table.insert(items, {
                    label = icon.icon .. '  ' .. icon.name,
                    insertText = icon.icon,
                    filterText = icon.name,
                })
            end
            callback({ items = items })
        end,
    })

    local saga = require 'lspsaga'

    -- use default config
    saga.init_lsp_saga({
        -- Options with default value
        -- "single" | "double" | "rounded" | "bold" | "plus"
        border_style = "bold",
        --the range of 0 for fully opaque window (disabled) to 100 for fully
        --transparent background. Values between 0-30 are typically most useful.
        saga_winblend = 0,
        -- when cursor in saga window you config these to move
        move_in_saga = { prev = '<C-p>', next = '<C-n>' },
        -- Error, Warn, Info, Hint
        -- use emoji like
        -- { "🙀", "😿", "😾", "😺" }
        -- or
        -- { "😡", "😥", "😤", "😐" }
        -- and diagnostic_header can be a function type
        -- must return a string and when diagnostic_header
        -- is function type it will have a param `entry`
        -- entry is a table type has these filed
        -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
        diagnostic_header = { " ", " ", " ", "ﴞ " },
        -- preview lines of lsp_finder and definition preview
        max_preview_lines = 10,
        -- use emoji lightbulb in default
        code_action_icon = "",
        -- if true can press number to execute the codeaction in codeaction window
        code_action_num_shortcut = true,
        -- same as nvim-lightbulb but async
        code_action_lightbulb = {
            enable = true,
            enable_in_insert = true,
            cache_code_action = true,
            sign = true,
            update_time = 150,
            sign_priority = 20,
            virtual_text = true,
        },
        -- finder icons
        finder_icons = {
            def = '  ',
            ref = '諭 ',
            link = '  ',
        },
        -- finder do lsp request timeout
        -- if your project big enough or your server very slow
        -- you may need to increase this value
        finder_request_timeout = 1500,
        finder_action_keys = {
            open = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = "q",
        },
        code_action_keys = {
            quit = "q",
            exec = "<CR>",
        },
        definition_action_keys = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>i',
            tabe = '<C-c>t',
            quit = 'q',
        },
        rename_action_quit = "<C-c>",
        rename_in_select = true,
        -- show symbols in winbar must nightly
        -- in_custom mean use lspsaga api to get symbols
        -- and set it to your custom winbar or some winbar plugins.
        -- if in_cusomt = true you must set in_enable to false
        --symbol_in_winbar = {
        --    in_custom = false,
        --    enable = true,
        --    separator = ' ',
        --    show_file = true,
        --    -- define how to customize filename, eg: %:., %
        --    -- if not set, use default value `%:t`
        --    -- more information see `vim.fn.expand` or `expand`
        --    -- ## only valid after set `show_file = true`
        --    file_formatter = "",
        --    click_support = false,
        --},
        -- show outline
        show_outline = {
            win_position = 'right',
            --set special filetype win that outline window split.like NvimTree neotree
            -- defx, db_ui
            win_with = '',
            win_width = 30,
            auto_enter = true,
            auto_preview = true,
            virt_text = '┃',
            jump_key = 'o',
            -- auto refresh when change buffer
            auto_refresh = true,
        },
        -- custom lsp kind
        -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
        custom_kind = {},
        -- if you don't use nvim-lspconfig you must pass your server name and
        -- the related filetypes into this table
        -- like server_filetype_map = { metals = { "sbt", "scala" } }
        server_filetype_map = {},
    })

    require('rust-tools').setup()

    -- Lua configuration
    local glance = require('glance')
    local actions = glance.actions

    glance.setup({
        height = 18, -- Height of the window
        zindex = 45,
        preview_win_opts = { -- Configure preview window options
            cursorline = true,
            number = true,
            wrap = true,
        },
        border = {
            enable = false, -- Show window borders. Only horizontal borders allowed
            top_char = '―',
            bottom_char = '―',
        },
        list = {
            position = 'right', -- Position of the list window 'left'|'right'
            width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
        },
        theme = { -- This feature might not work properly in nvim-0.7.2
            enable = true, -- Will generate colors for the plugin based on your current colorscheme
            mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
        },
        mappings = {
            list = {
                ['j'] = actions.next, -- Bring the cursor to the next item in the list
                ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
                ['<Down>'] = actions.next,
                ['<Up>'] = actions.previous,
                ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
                ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
                ['<C-u>'] = actions.preview_scroll_win(5),
                ['<C-d>'] = actions.preview_scroll_win(-5),
                ['v'] = actions.jump_vsplit,
                ['s'] = actions.jump_split,
                ['t'] = actions.jump_tab,
                ['<CR>'] = actions.jump,
                ['o'] = actions.jump,
                ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
                ['q'] = actions.close,
                ['Q'] = actions.close,
                ['<Esc>'] = actions.close,
                -- ['<Esc>'] = false -- disable a mapping
            },
            preview = {
                ['Q'] = actions.close,
                ['<Tab>'] = actions.next_location,
                ['<S-Tab>'] = actions.previous_location,
                ['<leader>l'] = actions.enter_win('list'), -- Focus list window
            },
        },
        hooks = {},
        folds = {
            fold_closed = '',
            fold_open = '',
            folded = true, -- Automatically fold list on startup
        },
        indent_lines = {
            enable = true,
            icon = '│',
        },
        winbar = {
            enable = true, -- Available strating from nvim-0.8+
        },
    })

    require("trouble").setup {
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        group = true, -- group results by file
        padding = true, -- add an extra new line on top of the list
        action_keys = { -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "k", -- previous item
            next = "j" -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
end

return M
