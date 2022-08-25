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
	use 'moll/vim-bbye' -- for more sensible delete buffer cmd

	-- themes (disabled other themes to optimize startup time)
	use 'sainnhe/sonokai'
	use 'tiagovla/tokyodark.nvim'
	use 'projekt0n/github-nvim-theme'
	-- use 'joshdick/onedark.vim'
	-- use { 'catppuccin/nvim', as='catppuccin' }
	-- use { 'sonph/onehalf', rtp='vim/' }
	-- use 'liuchengxu/space-vim-dark'
	-- use 'ahmedabdulrahman/aylin.vim'
	-- use "rebelot/kanagawa.nvim"
	use 'NLKNguyen/papercolor-theme'
	use 'liuchengxu/space-vim-dark'
	use 'sainnhe/edge'
	use 'B4mbus/oxocarbon-lua.nvim'
	use 'Th3Whit3Wolf/one-nvim'

	-- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- language
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'nvim-treesitter/nvim-treesitter'
	use 'simrat39/rust-tools.nvim'
	use 'simrat39/symbols-outline.nvim'

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	}

	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- floating terminal
	use 'akinsho/toggleterm.nvim'

	-- file telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- indent guide
	use "lukas-reineke/indent-blankline.nvim"

	-- startup screen
	use 'leslie255/aleph-nvim'

	-- english grammar check
	use 'rhysd/vim-grammarous'

	-- ascii image
	use 'samodostal/image.nvim'

end)
