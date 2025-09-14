return {
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          component_separators = '',
          -- section_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          always_divide_middle = true,
          always_show_tabline = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              icon = ' ',
              padding = {
                left = 1,
                right = 1,
              },
            },
          },
          lualine_b = {
            { 'branch', icon = '  branch:' },
            { 'diff' },
          },
          lualine_c = { { 'lsp_status', icon = '  LSP:' } },
          lualine_x = { {
            'encoding',
            icon = ' ',
          } },
          lualine_y = {
            { 'progress', icon = ' ' },
          },
          lualine_z = {
            { 'location', icon = ' ' },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { 'filename', path = 0, symbols = { modified = ' [+]', readonly = ' [RO]' } },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = { 'neo-tree', 'quickfix' },
      }
    end,
  },
}
