return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'InsertEnter' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
      },
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
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
          ['<Down>'] = {},
          ['<Up>'] = {},
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

        snippets = {
          preset = 'luasnip',
        },

        sources = {
          default = { 'lsp', 'snippets' },
          providers = {
            lsp = {
              name = 'LSP',
              enabled = true,
              module = 'blink.cmp.sources.lsp',
              kind = 'LSP',
              score_offset = 100,
            },
            snippets = {
              opts = {},
            },
          },
        },
      }
    end,
  },
}
