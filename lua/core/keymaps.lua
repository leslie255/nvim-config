vim.g.mapleader = ';'

local function map(mode, lhs, rhs)
vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true})
end

local function mapcmd(key, cmd)
vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', {noremap=true})
end

-- keymaps
-- f: file tree
mapcmd('<leader>ft', 'NvimTreeToggle')
mapcmd('<leader>ff', 'NvimTreeFocus')
-- y: telescope
local telescope = require('telescope.builtin')
mapcmd('<leader>yo', "Telescope find_files")
mapcmd('<leader>yg', "Telescope live_grep")
mapcmd('<leader>yb', "Telescope buffers")
-- c: quick command
map('n', '<leader>ce', ':e<space>')
mapcmd('<leader>cw', 'w')
mapcmd('<leader>cW', 'wa')
mapcmd('<leader>cE', 'e!')
mapcmd('<leader>cq', 'q')
mapcmd('<leader>cQ', 'q!')
mapcmd('<leader>cx', 'x')
-- w: window
map('n', '<leader>wh', '<c-w>h')
map('n', '<leader>wj', '<c-w>j')
map('n', '<leader>wk', '<c-w>k')
map('n', '<leader>wl', '<c-w>l')
map('n', '<leader>w1', '<c-w>o')
mapcmd('<leader>wx', 'x')
mapcmd('<leader>w2', 'sp')
mapcmd('<leader>w3', 'vs')
-- window resize
map('n', '<m-9>', '<c-w><')
map('n', '<m-0>', '<c-w>>')
map('n', '<m-->', '<c-w>-')
map('n', '<m-=>', '<c-w>+')
map('n', '<m-r>', 'resize<space>')
map('n', '<m-t>', 'vertical resize<space>')
-- b: buffer
mapcmd('<leader>bn', 'bn')
mapcmd('<leader>bp', 'bp')
mapcmd('<leader>bd', 'Bdelete')
-- p: plugins
mapcmd('<leader>pi', 'PackerInstall')
mapcmd('<leader>pc', 'PackerClean')
-- s: search
map('n', '<leader>ss', '/')
map('n', '<leader>sw', '/\\<lt>\\><left><left>')
-- l/g/w: language
-- l: general
-- g: goto
-- w: workspace
mapcmd('<leader>le', 'lua vim.diagnostic.open_float()')
mapcmd('<leader>lq', 'lua vim.diagnostic.setloclist()')
mapcmd('<leader>lk', 'lua vim.lsp.buf.hover()')
mapcmd('<leader>lr', 'lua vim.lsp.buf.rename()')
mapcmd('<leader>lh', 'lua vim.lsp.buf.signature_help()')
mapcmd('<leader>la', 'lua vim.lsp.buf.code_action()')
mapcmd('<leader>lf', 'lua vim.lsp.buf.formatting()')
mapcmd('<leader>lb', 'SymbolsOutline')

mapcmd('<leader>gD', 'lua vim.lsp.buf.declaration()')
mapcmd('<leader>gd', 'lua vim.lsp.buf.definition()')
mapcmd('<leader>gt', 'lua vim.lsp.buf.type_definition()')
mapcmd('<leader>gi', 'lua vim.lsp.buf.implementation()')
mapcmd('<leader>gp', 'lua vim.diagnostic.goto_prev()')
mapcmd('<leader>gn', 'lua vim.diagnostic.goto_next()')
mapcmd('<leader>gr', 'lua vim.lsp.buf.references()')

mapcmd('<leader>wa', 'lua vim.lsp.buf.add_workspace_folder()')
mapcmd('<leader>wr', 'lua vim.lsp.buf.remove_workspace_folder()')
mapcmd('<leader>wl', 'lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
-- t: terminal
mapcmd('<leader>tn', 'FloatermNew')
mapcmd('<leader>tt', 'FloatermToggle')

