return {
  'allaman/emoji.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- optional for nvim-cmp integration
    'hrsh7th/nvim-cmp',
    -- optional for telescope integration
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    -- default is false
    -- enable_cmp_integration = true,
  },
  config = function(_, opts)
    require('emoji').setup(opts)
    -- optional for telescope integration
    -- Insert emoji with :Telecope emoji
    require('telescope').load_extension 'emoji'
  end,
}
