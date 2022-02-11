-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- starup time optimise
    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    -- buffer
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'moll/vim-bbye'

    -- themes
    use 'joshdick/onedark.vim'
    use { 'catppuccin/nvim', as='catppuccin' }
    use { 'sonph/onehalf', rtp='vim/' }
    use 'sainnhe/sonokai'
    use 'liuchengxu/space-vim-dark'
    use 'ahmedabdulrahman/aylin.vim'

    -- start screen
    use 'matteogiorgi/vim-startscreen'

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- language
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-treesitter/nvim-treesitter'

    -- git
    use 'airblade/vim-gitgutter'

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- tagbar
    use 'preservim/tagbar'

    -- floating terminal
    use 'voldikss/vim-floaterm'

    -- file telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

end)

