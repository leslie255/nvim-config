require("core.keymaps")
require("core.plugins")
require("core.theme")

-- basics
--tabs
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.shiftround = true
vim.opt.updatetime=100
vim.opt.cursorline = true
vim.opt.autowrite = true
if vim.fn.has('termguicolors') then
    vim.opt.termguicolors = true
end

-- disable some useless standard plugins
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

-- impatient setup
require("impatient")
-- bufferline setup
require("bufferline").setup()
-- startup setup
--require("startup").setup()

require("configs.autocomplete").config()
require("configs.statusline").config()
require("configs.filetree").config()
require("configs.treesitter").config()
require("configs.outlinetree").config()

