vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'core.options'

-- [[ Basic Keymaps ]]
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

require 'core.autogroups'

require 'core.late-options'

--TODO trouble doesn't provide diagnostics

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
--	use { 'hrsh7th/nvim-cmp',                          -- Autocompletion
--	  requires = { 'hrsh7th/cmp-nvim-lsp' }
--	}
--	use { 'L3MON4D3/LuaSnip',                        -- Snippet Engine and Snippet Expansion
--	  requires = { 'saadparwaiz1/cmp_luasnip' }
--	}
--
--	--use { "ggandor/leap.nvim" }
--	use { "folke/flash.nvim" }
--
--	-- make file helper and more
--	use { "desdic/greyjoy.nvim" }
--
--	use { "shaunsingh/solarized.nvim" }
--
--	use { "rafamadriz/friendly-snippets" }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
