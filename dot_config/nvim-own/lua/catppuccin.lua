return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
  config = function()
    local catppuccin = require 'catppuccin'

    catppuccin.setup {
      flavour = 'mocha',
      compile = { enabled = true, path = vim.fn.stdpath 'cache' .. '/catppuccin' },
      transparent_background = false,
      term_colors = false,
      integrations = {
        aerial = true,
        bufferline = true,
        cmp = true,
        dap = { enabled = true, enable_ui = true },
        gitsigns = true,
        lsp_trouble = true,
        markdown = false,
        mason = true,
        mini = true,
        native_lsp = { enabled = true },
        notify = true,
        nvimtree = { enabled = true, show_root = false },
        rainbow_delimiters = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    }

    -- vim.g.catppuccin_flavour = "macchiato"
    vim.cmd [[colorscheme catppuccin]]

    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment' })
  end,
}
