local M = {}
function M.config()
    -- nvim-treesitter config
    require 'nvim-treesitter.configs'.setup {
        -- ensure_installed = "maintained", -- for installing all maintained parsers
        ensure_installed = { "c", "cpp", "rust", "lua" }, -- for installing specific parsers
        sync_install = true, -- install synchronously
        ignore_install = {}, -- parsers to not install
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- disable standard vim highlighting
        },
    }
end

return M
