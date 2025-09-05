return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
    {
      '<leader>tf',
      function()
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      end,
      mode = '',
      desc = 'Toggle autoformat for buffer',
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    --  notify_on_error = false,
    -- Define your formatters
    formatters_by_ft = {
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      go = { 'goimports', 'gofmt', 'gofumpt', 'gci' },
      --go = { 'golines', 'goimports', 'gofmt', 'gofumpt', 'gci' },
      javascript = { { 'prettierd', 'prettier' } },
      json = { 'jq' },
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      rust = { 'rustfmt' },
      sh = { 'shfmt' },
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function()
      if args.bang then
        -- FormatEnable! will enable formatting just for this buffer
        vim.b.disable_autoformat = false
      else
        vim.g.disable_autoformat = false
      end
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
