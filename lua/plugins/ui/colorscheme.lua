return {
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require 'fluoromachine'
      fm.setup {
        glow = false,
        theme = 'fluoromachine',
        transparent = true,
      }
      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
  {
    'samharju/synthweave.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'synthweave'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = {
            wave = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function()
          return {}
        end,
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
