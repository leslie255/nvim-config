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

require("configs.autocomplete")
require("configs.statusline")

-- bufferline config
require("bufferline").setup {}

require("configs.filetree")
require("configs.treesitter")
require("configs.outlinetree")

