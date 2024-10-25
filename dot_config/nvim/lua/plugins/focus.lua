return {
  'nvim-focus/focus.nvim',
  event = 'VeryLazy',
  opts = {
    enable = true,
    cursorline = false,
    signcolumn = false,
    winhighlight = true,
    autoresize = {
      --minwidth = 30 -- seems to not work
    },
    ui = {
      hybridnumber = true,
    },
  },
}
--vim.cmd('hi link UnfocusedWindow ActiveWindow')
--vim.cmd('hi link FocusedWindow InactiveWindow')
