return {
  'mistricky/codesnap.nvim',
  event = 'BufReadPre',
  keys = {
    { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Copy code snapshot to clipboard' },
    { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save code snapshot to Pictures' },
  },
  config = function()
    require('codesnap').setup {
      save_path = vim.fn.expand '~/Pictures/Codescreenshots',
      has_breadcrumbs = true,
      code_theme = 'grape',
      watermark = '',
    }
  end,
}
