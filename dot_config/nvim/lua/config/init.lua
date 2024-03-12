vim.keymap.del('n', 'Y')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = ","
-- yank everything directly to main clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/config/init.vim')
vim.loader.enable()

require('config.lualine')
--require("config.possession")
require("config.sessions")
require("config.telescope")
require("config.indent_blankline")
require("config.treesitter")
require("config.toggleterm")
require("config.focus")
require("config.neo-minimap")
require("config.chezmoi")
require("config.greyjoy")
--TODO fucked up colors, so fix
--require("config.rainbow-delimiters")
--require("config.solarized")
--require("config.leap")

--require("shade").setup({
--  overlay_opacity = 50,
--  opacity_step = 1,
--  keys = {
--    brightness_up    = '<Leader>u',
--    brightness_down  = '<Leader>d',
--    toggle           = '<Leader>s',
--  }
--})


--vim.cmd('set background=light')
--vim.cmd('let g:neosolarized_contrast = "high"')
--vim.cmd('colorscheme NeoSolarized')

require("config.lsp.mason")
require("config.lsp.lspconfig")
require("config.lsp.null-ls")
require("config.go")

vim.api.nvim_set_hl(0, 'Pmenu', { bg='black', fg='white' })
vim.api.nvim_set_hl(0, 'ActiveWindow', { ctermbg='NONE' })
vim.api.nvim_set_hl(0, 'InactiveWindow', { ctermbg='LightGrey' })
vim.api.nvim_exec([[
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
]], false)

vim.opt.mouse = ''
vim.o.mouse = ''
--vim.opt.ttymouse = ''
