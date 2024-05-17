local M = {}
function M.config()
    -- vim.g.vimtex_view_general_viewer = "open"
    -- vim.g.vimtex_view_general_options = ""
    vim.g.vimtex_view_method = "zathura"
    vim.g.tex_flavor="latex"
    vim.g.vimtex_view_method="zathura"
    vim.g.vimtex_quickfix_mode=0
    vim.cmd "highlight! Conceal guifg=white"
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {"tex"},
        callback = function()
            vim.cmd("VimtexCompile")
        end,
    })
end
return M

