return {
  -- 'catgoose/nvim-colorizer.lua',
  'brenoprata10/nvim-highlight-colors',
  event = 'BufReadPre',
  opts = {
    enable_tailwind = true,
    render = 'virtual',
    virtual_symbol = '',
    -- filetypes = { 'html', 'css', 'js', 'md', 'nix', 'json' },
  },
}
