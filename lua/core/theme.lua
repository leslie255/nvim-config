-- themes

-- themes with special settings

-- sonokai
--sonokai styles: default, atlantis, andromeda, shusia, maia, espresso
--vim.g.sonokai_style = 'default'
--vim.g.sonokai_enable_italic = 0
--vim.g.sonokai_disable_italic_comment = 0
--vim.cmd('colorscheme sonokai')

-- tokyo night
-- vim.g.tokyodark_transparent_background = false
--vim.g.tokyodark_enable_italic_comment = true
--vim.g.tokyodark_enable_italic = true
--vim.g.tokyodark_color_gamma = "1.0"
--vim.cmd("colorscheme tokyodark")

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
--vim.g.tokyonight_colors = { hint = "orange", error = "#cb5550" }
--vim.cmd('colorscheme sonokai')

-- space vim dark
-- vim.g.space_vim_dark_background = 234 -- 234 (darkest) ~ 238 (lightest)
-- vim.cmd("colorscheme space-vim-dark");

-- kanagwa
-- Default options:
--require('kanagawa').setup({
--    undercurl = true,           -- enable undercurls
--    commentStyle = { italic = true },
--    functionStyle = {},
--    keywordStyle = { italic = true},
--    statementStyle = { bold = true },
--    typeStyle = {},
--    variablebuiltinStyle = { italic = true},
--    specialReturn = true,       -- special highlight for the return keyword
--    specialException = true,    -- special highlight for exception handling keywords
--    transparent = false,        -- do not set background color
--    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
--    globalStatus = false,       -- adjust window separators highlight for laststatus=3
--    colors = {},
--    overrides = {},
--})

--vim.cmd("colorscheme kanagawa")

-- edge
vim.g.edge_style = 'aura' -- neon, aura
vim.g.edge_better_performance = 1
vim.cmd("colorscheme edge")

-- github
-- vim.cmd("colorscheme github_dark_default")

-- oxocarbon
-- vim.cmd("colorscheme oxocarbon-lua")

vim.cmd("set background=dark")
