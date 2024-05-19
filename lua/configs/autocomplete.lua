local M = {}

function M.config()
    -- Set up nvim-lspconfig.
    -- List of all pre-configured LSP servers:
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    
    -- Servers without extra config
    local servers = { 'pylsp', 'html', 'zls' }
    local lspconfig = require('lspconfig')
    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {}
    end

    -- Servers with extra config
    lspconfig['rust_analyzer'].setup {                
        settings = {                      
            ["rust-analyzer"] = {
                procMacro = { enable = true },
            }
        }
    }
    lspconfig['clangd'].setup {
        cmd = {'clangd', '-header-insertion=never' }
    }

    -- Setup nvim-cmp.
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    cmp.setup({
      experimental = { ghost_text = true },
      snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
      },
      window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "path" },
      }, {
          { name = 'buffer' },
      })
    })

    -- nvim-cmp for commands
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    local nlspsettings = require("nlspsettings")
    nlspsettings.setup({
        config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
        local_settings_dir = ".nlsp-settings",
        local_settings_root_markers_fallback = { '.git' },
        append_default_schemas = true,
        loader = 'json'
    })

    require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets/"})

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

    --- Set up LspSaga.
    require("lspsaga").setup({
        ui = {
            -- This option only works in Neovim 0.9
            title = true,
            -- Border type can be single, double, rounded, solid, shadow.
            border = "single",
            winblend = 0,
            expand = " ",
            collapse = " ",
            code_action = " ",
            incoming = " ",
            outgoing = " ",
            hover = ' ',
            kind = {},
        },
    })

    local glance = require('glance')
    local actions = glance.actions

    glance.setup({
        height = 18, -- Height of the window
        zindex = 45,
        preview_win_opts = { -- Configure preview window options
            cursorline = true,
            number = true,
            wrap = false,
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
            mode = 'darken', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
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
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "󰮍"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
end

return M
