return {
  'baest/sessions.nvim',
  opts = {
    events = { 'WinEnter', 'VimLeavePre', 'BufEnter', 'BufWinEnter' },
    session_filepath = vim.env.HOME .. '/.nvim/sessions',
  },
}
