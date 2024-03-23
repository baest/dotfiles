return {
  {
    'natecraddock/sessions.nvim',
    config = function()
      require('sessions').setup {
        events = { 'WinEnter', 'VimLeavePre', 'BufEnter', 'BufWinEnter' },
      }
    end,
  },
}
