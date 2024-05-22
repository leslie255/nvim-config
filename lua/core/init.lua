-- Basics.
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.shiftround     = true
vim.opt.updatetime     = 100
vim.opt.cursorline     = true
vim.opt.autowrite      = true
if (vim.fn.has('termguicolors')) then
    vim.opt.termguicolors = true
end
vim.opt.autoindent    = true
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.softtabstop   = 4
vim.opt.mouse         = "a"
vim.opt.expandtab     = true
vim.opt.autowrite     = false
vim.opt.wrap          = false
vim.opt.formatoptions = ""
vim.opt.signcolumn    = "yes" -- Prevent sign column flickering.

-- Leader key has to be set up before setting up lazy.nvim.
vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

-- Disable builtin features to save startup time.
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Status line.
-- vim.opt.cmdheight = 0
-- Show status line during macro recording.
-- vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
--   callback = function()
--                vim.opt.cmdheight = 1
--              end,
-- })
-- vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
--   callback = function()
--                vim.opt.cmdheight = 0
--              end,
-- })

require("core.plugins")

require("core.gui")

require("configs.autocomplete").config()
require("configs.statusline").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.bufferline").config()
require("configs.grammar").config()
require("configs.terminal").config()
require("configs.filemanager").config()
require("configs.scrollbar").config()
require("configs.telescope").config()

--- If there is a `configs.lang.ft`, load it and call `.config()` on it.
local function try_load_lang_config(ft)
    local name = "configs.lang." .. ft
    if package.loaded[name] then
        -- print(name .. " is already loaded")
    else
        local success, module = pcall(require, name)
        if success then
            print(name .. " loaded")
            module.config()
        end
    end
end

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function()
        local ft = vim.api.nvim_buf_get_option(0, "filetype")
        try_load_lang_config(ft)
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local bg = vim.opt.background:get()
        if bg == "dark" then
            vim.cmd("hi Visual guifg=Black guibg=White")
        elseif bg == "light" then
            vim.cmd("hi Visual guifg=White guibg=Black")
        end
    end,
})

require("core.keymaps")
require("core.theme")
