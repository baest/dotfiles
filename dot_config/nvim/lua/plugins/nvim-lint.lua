return {
  -- Lint file
  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    config = function(_, opts)
      local lint = require 'lint'
      lint.linters_by_ft = {
        go = { 'golangcilint' },
        markdown = { 'cspell' },
      }

      -- Override options since latest golangcilint has changed options
      local golangcilint = lint.linters.golangcilint
      golangcilint.args = {
        'run',
        '--output.json.path',
        'stdout',
        '--issues-exit-code=0',
        '--show-stats=false',
        function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h')
        end,
      }

      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
        callback = function()
          lint.try_lint()
          -- lint.try_lint('cspell') -- always lint with cspell
        end,
      })

      -- vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      --   callback = function()
      --     local names = lint._resolve_linter_by_ft(vim.bo.filetype)
      --
      --     -- Create a copy of the names table to avoid modifying the original.
      --     names = vim.list_extend({}, names)
      --
      --     -- Add fallback linters.
      --     if #names == 0 then
      --       vim.list_extend(names, lint.linters_by_ft['_'] or {})
      --     end
      --
      --     -- Add global linters.
      --     vim.list_extend(names, lint.linters_by_ft['*'] or {})
      --
      --     -- Run linters.
      --     if #names > 0 then
      --       -- Check if the linter is available, otherwise it will throw an error.
      --       for _, name in ipairs(names) do
      --         local cmd = vim.fn.executable(name)
      --         if cmd == 0 then
      --           vim.notify('Linter ' .. name .. ' is not available', vim.log.levels.INFO)
      --           return
      --         else
      --           -- Run the linter
      --           lint.try_lint(name)
      --         end
      --       end
      --     end
      --   end,
      -- })
      vim.keymap.set('n', '<leader>lf', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
}
