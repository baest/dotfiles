return {
  'chrisgrieser/nvim-lsp-endhints',
  event = 'LspAttach',
  opts = {
    icons = {
      type = '󰜁 ',
      parameter = '󰏪 ',
    },
    label = {
      padding = 1,
      marginLeft = 0,
      bracketedParameters = true,
    },
    autoEnableHints = true,
  }, -- required, even if empty
  config = function(_, opts)
    require('lsp-endhints').setup(opts)
  end,
}
