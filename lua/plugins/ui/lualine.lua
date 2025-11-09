return {
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      local lualine = require 'lualine'

      local function gitsigns_diff()
        local signs = vim.b.gitsigns_status_dict
        if not signs then
          return ''
        end

        local icons = {
          added = ' ',
          changed = ' ',
          removed = ' ',
        }

        local parts = {}
        for name, icon in pairs(icons) do
          local count = tonumber(signs[name])
          if count and count > 0 then
            table.insert(parts, icon .. count)
          end
        end

        if #parts > 0 then
          return table.concat(parts, ' ')
        end

        return ''
      end

      lualine.setup {
        options = {
          icons_enabled = true,
          component_separators = '',
          section_separators = { left = ' ', right = ' ' },
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
              separator = { left = '', right = ' ' },
              padding = {
                left = 1,
                right = 1,
              },
            },
          },
          lualine_b = {
            -- { 'branch', icon = ' branch:' },
            -- { 'diff' },
            { 'lsp_status', icon = ' LSP:' },
          },
          lualine_c = { --[[{ 'lsp_status', icon = '  LSP:' }]]
          },
          lualine_x = {
            --[[{
              'encoding',
              icon = ' ',
            },]]
          },
          lualine_y = {
            {
              'encoding',
              icon = '',
            },
            { 'progress', icon = '' },
          },
          lualine_z = {
            {
              'location',
              icon = '',
              separator = { left = ' ', right = '' },
              left_padding = 2,
            },
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
        tabline = {
          lualine_a = {
            { 'filename', path = 0, symbols = { modified = ' [+]', readonly = ' [RO]' }, separator = { left = '', right = ' ' } },
          },
          lualine_y = {
            {
              'diagnostics',
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_z = {
            { gitsigns_diff },
            {
              'branch',
              icon = ' branch:',
              separator = { left = ' ', right = '' },
            },
          },
        },
        extensions = { 'neo-tree', 'quickfix' },
      }
    end,
  },
}
