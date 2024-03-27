vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

require 'late-options'

-- TODO
--	use({"nvim-telescope/telescope-fzy-native.nvim"})
--	use({'nvim-telescope/telescope.nvim'})

--	use 'HiPhish/rainbow-delimiters.nvim'
--
--	use 'neovim/nvim-lspconfig'                        -- Collection of configurations for built-in LSP client
--	use 'williamboman/mason.nvim'
--	use 'williamboman/mason-lspconfig.nvim'
--	use 'jose-elias-alvarez/null-ls.nvim'
--	use 'jayp0521/mason-null-ls.nvim'
--	use 'SmiteshP/nvim-navic'
--
--	use("ziontee113/neo-minimap")
--
--	use("xvzc/chezmoi.nvim")
--
--	--use("alker0/chezmoi.vim")
--
--	use {
--		"folke/trouble.nvim",
--		requires = "kyazdani42/nvim-web-devicons",
--		config = function()
--			require("trouble").setup {
--				-- your configuration comes here
--				-- or leave it empty to use the default settings
--				-- refer to the configuration section below
--			}
--		end
--	}
--
--	use { 'hrsh7th/nvim-cmp',                          -- Autocompletion
--	  requires = { 'hrsh7th/cmp-nvim-lsp' }
--	}
--	use { 'L3MON4D3/LuaSnip',                        -- Snippet Engine and Snippet Expansion
--	  requires = { 'saadparwaiz1/cmp_luasnip' }
--	}
--
--	use { "akinsho/toggleterm.nvim", tag = '*' }
--
--	--use { "ggandor/leap.nvim" }
--	use { "folke/flash.nvim" }
--
--	-- make file helper and more
--	use { "desdic/greyjoy.nvim" }
--
--	-- remove hlsearch when moving cursor
--	use { "romainl/vim-cool" }
--
--	use 'ray-x/go.nvim'
--	use 'ray-x/guihua.lua' -- recommended if need floating window support
--
--	use { "shaunsingh/solarized.nvim" }
--
--	use { "rafamadriz/friendly-snippets" }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
