return {
  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
    keys = {
      { '<Leader>tp', '<cmd>TSPlaygroundToggle<CR>', desc = 'Treesitter playground' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    keys = {
      { '<Leader>tc', '<cmd>TSContextToggle<CR>', desc = 'Treesitter context' },
    },
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
          'class',
          'function',
          'method',
          'for',
          'while',
          'if',
          'switch',
          'case',
        },
        markdown = { 'section' },
        json = { 'pair' },
        yaml = { 'block_mapping_pair' },
      },
      zindex = 20, -- The Z-index of the context window
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      separator = nil,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'dockerfile',
          'glsl',
          'go',
          'gomod',
          'gosum',
          'html',
          'json',
          'json5',
          'jsonc',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'meson',
          'perl',
          'php',
          'python',
          'query',
          'regex',
          'ruby',
          'rust',
          'sql',
          'toml',
          'vim',
          'vimdoc',
          'yaml',
        },
        indent = { enable = true, disable = {} },
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = function(lang, bufnr)
            return lang == 'yaml' and vim.api.nvim_buf_line_count(bufnr) > 5000
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<BS>',
          },
        },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          swap = {
            enable = true,
            swap_next = { ['fa'] = '@parameter.inner' },
            swap_previous = { ['fA'] = '@parameter.inner' },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = '@function.outer',
              [']b'] = '@block.inner',
              [']c'] = '@class.outer',
              [']l'] = '@loop.outer',
              [']i'] = '@conditional.outer',
              [']p'] = '@parameter.inner',
              [']o'] = '@call.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[b'] = '@block.inner',
              ['[c'] = '@class.outer',
              ['[l'] = '@loop.outer',
              ['[i'] = '@conditional.outer',
              ['[p'] = '@parameter.inner',
              ['[o'] = '@call.outer',
            },
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 5, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
      }
    end,
  },
}
--return {
--  { -- Highlight, edit, and navigate code
--    'nvim-treesitter/nvim-treesitter',
--    build = ':TSUpdate',
--    opts = {
--      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'perl', 'yaml', 'go', 'gosum', 'gomod', 'python', 'query' },
--      -- Autoinstall languages that are not installed
--      auto_install = true,
--      highlight = { enable = true },
--      indent = { enable = true },
--    },
--    config = function(_, opts)
--      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
--      ---@diagnostic disable-next-line: missing-fields
--      require('nvim-treesitter.configs').setup(opts)
--
--      -- There are additional nvim-treesitter modules that you can use to interact
--      -- with nvim-treesitter. You should go explore a few and see what interests you:
--      --
--      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--    end,
--  },
--}
-- vim: ts=2 sts=2 sw=2 et
