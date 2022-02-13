local M = {}

function M.config()
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = { -- TODO: do these mappings
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --[''] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --[''] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        --[''] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        --[''] = cmp.mapping({
        --    i = cmp.mapping.abort(),
        --    c = cmp.mapping.close(),
        --}),
    },
    sources = cmp.config.sources({
        { name = 'luasnip' },
        -- { name = 'nvim_lsp' },
        -- { name = 'ultisnips' },
        -- { name = 'snippy' },
        }, {{ name = 'buffer' }})
    })

    -- completion for status line commands (if you enabled `native_menu`, this won't work anymore).
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

    -- nvim-lspconfig config
    local servers = { 'clangd', 'ccls' }
    for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
    end
end

return M
