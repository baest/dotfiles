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

--	remove hlsearch when moving cursor. Seem to be unnecessary
--	use { "romainl/vim-cool" }
-- using flash currently so??
--	--use { "ggandor/leap.nvim" }

-- TODO
--	use 'SmiteshP/nvim-navic'
--	use("ziontee113/neo-minimap")
--
--	use({"nvim-telescope/telescope-fzy-native.nvim"})

--	use 'HiPhish/rainbow-delimiters.nvim'
--
--	use 'jose-elias-alvarez/null-ls.nvim'
--	use 'jayp0521/mason-null-ls.nvim'
--
--	use { 'L3MON4D3/LuaSnip',                        -- Snippet Engine and Snippet Expansion
--	  requires = { 'saadparwaiz1/cmp_luasnip' }
--	}
--
--	-- make file helper and more
--	use { "desdic/greyjoy.nvim" }
--
--	use { "shaunsingh/solarized.nvim" }
--
--	--use { "imsnif/kdl.vim" }
--	use { "rafamadriz/friendly-snippets" }
--
--	use { 'kiran94/edit-markdown-table.nvim' }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
