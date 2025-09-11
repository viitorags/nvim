return {
  {
    ---@diagnostic disable-next-line: assign-type-mismatch
    'saghen/blink.cmp',
    event = { 'InsertEnter' },
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      vim.api.nvim_set_hl(0, 'CmpMenu', { bg = 'none' })
      local blink = require 'blink-cmp'
      blink.setup {
        keymap = {
          preset = 'default',
          ['<CR>'] = {
            'accept',
            'fallback',
          },
          ['<Tab>'] = {},
          ['<S-Tab>'] = {},
        },

        appearance = {
          use_nvim_cmp_as_default = false,
        },

        completion = {
          menu = {
            border = 'rounded',
            winhighlight = 'Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None',
            draw = {
              columns = {
                { 'kind_icon', 'kind', gap = 1 },
                { 'label', 'label_description' },
              },
            },
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = false,
            },
          },
          documentation = {
            auto_show = true,
            window = {
              border = 'rounded',
              winhighlight = 'Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None',
            },
          },
        },
      }
    end,
  },
}
