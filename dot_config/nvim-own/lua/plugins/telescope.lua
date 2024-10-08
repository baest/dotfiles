-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`

      local sorters = require('telescope.sorters')
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { '.git/', '.cache/', 'vendor', '.local', '.jj/' },
          prompt_prefix = ' ',
          selection_caret = ' ',
          mappings = {
            i = {
              --['<C-j>'] = actions.move_selection_next,
              --['<C-k>'] = actions.move_selection_previous,
              --['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
              ['<esc>'] = actions.close,
              ['<CR>'] = actions.select_default + actions.center,

              -- You can perform as many actions in a row as you like
              -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
              ['<C-h>'] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
              --['<C-j>'] = actions.move_selection_next,
              --['<C-k>'] = actions.move_selection_previous,
              --['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
              ['<C-h>'] = actions.which_key,
            },
          },
        },
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            --sort_lastused = true,
            sort_mru = true,
            --sorter = sorters.get_substr_matcher(),
            sorter = sorters.get_fzy_sorter(),
            show_all_buffers = true,
            path_display = { 'absolute' },
          },
          colorscheme = {
            enable_preview = true,
          },
          lsp_references = {
            preview = true, -- error on launchin lsp_references
          },
        },
        extensions = {
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
        },
      }

      local ts = require('telescope') 
      -- Enable telescope extensions, if they are installed
      pcall(ts.load_extension, 'fzf')
      pcall(ts.load_extension, 'ui-select')
      pcall(ts.load_extension, 'chezmoi')

      -- See `:help telescope.builtin`
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<S-Tab>', function()
        builtin.find_files {
          find_command = {
            'fd',
            '--type=f',
            '--absolute-path',
            '--hidden',
            '--no-ignore',
            '--exclude',
            '.git',
            '--exclude',
            '__pycache__',
            '--ignore-file',
            '.ts_ignore',
          },
          hidden = true,
          previewer = true,
          wrap_results = true,
          prompt_title = 'Search files',
        }
      end, { noremap = true, silent = true, desc = 'Search files' })
      vim.keymap.set('n', '<Tab>', function()
        builtin.buffers({
            --initial_mode = "normal",
            attach_mappings = function(prompt_bufnr, map)
              local delete_buf = function()
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                current_picker:delete_selection(function(selection)
                  vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                end)
              end

              map('i', '<c-x>', delete_buf)

              return true
            end
          }
        )
      end, { noremap = true, silent = true, desc = 'Show buffers' })

      -- setup chezmoi
      vim.keymap.set('n', '<leader>cz', ts.extensions.chezmoi.find_files, {})

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
