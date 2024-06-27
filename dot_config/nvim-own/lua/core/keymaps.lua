-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
--vim.opt.hlsearch = true
--vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
local keymap = vim.keymap.set

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap('n', '<ScrollWheelUp>', '<nop>', { desc = 'Disable scrollwheel' })
keymap('n', '<ScrollWheelDown>', '<nop>', { desc = 'Disable scrollwheel' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

----- Highlight when yanking (copying) text
-----  Try it with `yap` in normal mode
-----  See `:help vim.highlight.on_yank()`
---vim.api.nvim_create_autocmd('TextYankPost', {
---  desc = 'Highlight when yanking (copying) text',
---  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
---  callback = function()
---    vim.highlight.on_yank()
---  end,
---})

-- lsp

-- vim: ts=2 sts=2 sw=2 et
