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
        local parts = {}
        if signs.added and signs.added > 0 then
          table.insert(parts, '%#GitSignsAdd#+' .. signs.added)
        end
        if signs.changed and signs.changed > 0 then
          table.insert(parts, '%#GitSignsChange#~' .. signs.changed)
        end
        if signs.removed and signs.removed > 0 then
          table.insert(parts, '%#GitSignsDelete#-' .. signs.removed)
        end
        return #parts > 0 and ('[MOD:' .. table.concat(parts, ' ') .. '%*]') or ''
      end

      local function lsp_status()
        local clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #clients == 0 then
          return '[SYSTEM:OFFLINE]'
        end
        return '[SYS:' .. string.upper(clients[1].name) .. ']'
      end

      lualine.setup {
        options = {
          theme = 'auto',
          icons_enabled = true,
          -- Separadores afiados
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          refresh = { statusline = 100, tabline = 100, winbar = 100 },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return '󰣚 ' .. str:upper()
              end,
              separator = { right = '' },
            },
          },
          lualine_b = {
            { 'branch', icon = '' },
            { lsp_status, color = { gui = 'bold' } },
          },
          lualine_c = {
            {
              function()
                return 'PATH:'
              end,
              color = { fg = '#585b70' },
              padding = { left = 1, right = 0 },
            },
            { 'filename', path = 1, symbols = { modified = '󰶐', readonly = '' } },
          },
          lualine_x = {
            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' } },
          },
          lualine_y = {
            { 'encoding', fmt = string.upper },
            { 'progress', icon = '' },
          },
          lualine_z = {
            { 'location', icon = '', separator = { left = '' } },
          },
        },
        tabline = {
          lualine_a = {
            {
              'filename',
              path = 0,
              fmt = function(name)
                return '󰈚 [CORE_FS:' .. name:upper() .. ']'
              end,
              separator = { right = '' },
            },
          },
          lualine_x = {
            { gitsigns_diff, padding = { right = 1 } },
          },
          lualine_z = {
            {
              'branch',
              icon = '',
              fmt = function(str)
                return 'NET://' .. str:upper()
              end,
              separator = { left = '' },
              color = { gui = 'bold' },
            },
          },
        },
        extensions = { 'neo-tree', 'quickfix', 'fugitive' },
      }
    end,
  },
}
