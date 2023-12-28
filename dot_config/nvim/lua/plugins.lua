local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Unable to require packer")
	return
end

packer.init({
	display = {
	open_fn = function()
		return require("packer.util").float({border = "rounded"})
		end
	 }
})

return require('packer').startup(function(use)
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'
	use({"wbthomason/packer.nvim"})

	use({"dstein64/vim-startuptime"}) -- :StartupTime

	use {'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- used by other plugins
	use({"rcarriga/nvim-notify"})

	-- usefull stuff
	use({"farmergreg/vim-lastplace"})

	--use({"blueyed/vim-diminactive"})
	--neither worked well
	--use({"sunjon/shade.nvim"})
	--use {'TaDaa/vimade', opt=true, event='BufReadPre'}
	--use({"tadaa/vimade"})
	--use { "beauwilliams/focus.nvim" }
	use { 'nvim-focus/focus.nvim' }

	use({"tpope/vim-sleuth"})
	use({"tpope/vim-eunuch"})
	--use({"overcache/NeoSolarized"})
	--use({"p00f/nvim-ts-rainbow"})
	
	--use {'averms/black-nvim', ft = 'python', config = 'vim.cmd [[UpdateRemotePlugins]]'}

	-- consider replacing with https://github.com/sindrets/diffview.nvim
	use({ 'rhysd/committia.vim' })

	use { 'natecraddock/sessions.nvim' }

	use({'nvim-lua/plenary.nvim'})
	use({"nvim-telescope/telescope-fzy-native.nvim"})
	use({'nvim-telescope/telescope.nvim'})

	use "lukas-reineke/indent-blankline.nvim"

	use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}
	use 'nvim-treesitter/nvim-treesitter-textobjects'  -- Additional textobjects for treesitter
        use 'p00f/nvim-ts-rainbow'

	use 'neovim/nvim-lspconfig'                        -- Collection of configurations for built-in LSP client
	use 'williamboman/nvim-lsp-installer'              -- Automatically install language servers to stdpath
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jayp0521/mason-null-ls.nvim'
        use 'SmiteshP/nvim-navic'

	use("ziontee113/neo-minimap")

	-- TODO not setup'ed
	use("xvzc/chezmoi.nvim")

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

	use { 'hrsh7th/nvim-cmp',                          -- Autocompletion 
	  requires = { 'hrsh7th/cmp-nvim-lsp' } 
	}
	use { 'L3MON4D3/LuaSnip',                        -- Snippet Engine and Snippet Expansion
	  requires = { 'saadparwaiz1/cmp_luasnip' }
	}

	use { "akinsho/toggleterm.nvim", tag = '*' }

	use { "ggandor/leap.nvim" }

	-- remove hlsearch when moving cursor
	use { "romainl/vim-cool" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
	  require('packer').sync()
	end
end)

