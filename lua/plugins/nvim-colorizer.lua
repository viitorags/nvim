return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    filetypes = { 'html', 'css', 'js', 'md' },
  },
}
