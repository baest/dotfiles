--return {
--  { -- You can easily change to a different colorscheme.
--    -- Change the name of the colorscheme plugin below, and then
--    -- change the command in the config to whatever the name of that colorscheme is
--    --
--    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
--    'folke/tokyonight.nvim',
--    priority = 1000, -- make sure to load this before all the other start plugins
--    init = function()
--      -- Load the colorscheme here.
--      -- Like many other themes, this one has different styles, and you could load
--      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--      vim.cmd.colorscheme 'delek'
--      --vim.cmd [[colorscheme gruvbox]]
--
--      -- You can configure highlights by doing something like
--      --vim.cmd.hi 'Comment gui=none'
--    end,
--  },
--}

return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'light' -- or 'light'

      vim.cmd.colorscheme 'solarized'

      require('solarized').setup {
        theme = 'neo',
        styles = {
          comments = { italic = false },
        },
      }
    end,
  },
}

--return {
--  {
--    'catppuccin/nvim',
--    priority = 1000,
--    --    config = function()
--    --      --vim.o.background = 'light' -- or 'light'
--    --
--    --      --require('catppuccin').setup {
--    --      --  flavour = "auto"
--    --      --}
--    --    end,
--    init = function()
--      -- Load the colorscheme here.
--      -- Like many other themes, this one has different styles, and you could load
--      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--      --vim.cmd.colorscheme 'delek'
--      vim.cmd.colorscheme 'catppuccin-latte'
--
--      -- You can configure highlights by doing something like
--      --vim.cmd.hi 'Comment gui=none'
--    end,
--  },
--}
-- vim: ts=2 sts=2 sw=2 et