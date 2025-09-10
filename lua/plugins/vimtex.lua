return {
  {
    'lervag/vimtex',
    event = 'BufReadPre',
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
