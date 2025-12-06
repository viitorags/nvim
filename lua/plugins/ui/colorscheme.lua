return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        options = {
          cursorline = true,
          highlight_inactive_windows = false,
        },
        highlights = {
          LineNr = { bg = 'NONE' },
          Comment = { italic = true },
          Directory = { bold = true },
          ErrorMsg = { italic = true, bold = true },
        },
        styles = {
          types = 'NONE',
          methods = 'NONE',
          numbers = 'NONE',
          strings = 'NONE',
          comments = 'italic',
          keywords = 'bold,italic',
          constants = 'NONE',
          functions = 'italic',
          operators = 'NONE',
          variables = 'NONE',
          parameters = 'italic',
          conditionals = 'italic',
          virtual_text = 'NONE',
        },
      }
      vim.cmd.colorscheme 'vaporwave'
    end,
  },
}
