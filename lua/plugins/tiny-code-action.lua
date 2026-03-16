return {
  'rachartier/tiny-code-action.nvim',
  event = 'LspAttach',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  opts = {
    picker = 'buffer',
  },
}
