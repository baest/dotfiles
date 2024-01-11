vim.api.nvim_exec([[
hi ActiveWindow ctermbg=NONE
hi InactiveWindow ctermbg=LightGrey
]], false)
vim.keymap.del('n', 'Y')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = ","

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/config/init.vim')
vim.loader.enable()
--require('impatient')

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

vim.api.nvim_exec([[
hi ActiveWindow ctermbg=NONE
hi InactiveWindow ctermbg=LightGrey
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
]], false)

vim.opt.mouse = ''
vim.o.mouse = ''
--vim.opt.ttymouse = ''
