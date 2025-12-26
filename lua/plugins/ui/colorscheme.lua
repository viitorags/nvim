return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      if require('nixCatsUtils').isNixCats then
        vim.g.gruvbox_material_transparent_background = 1
      end
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_float_style = 'bright'
      vim.g.gruvbox_material_ui_contrast = 'high'

      local grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = grpid,
        pattern = 'gruvbox-material',
        callback = function()
          local function hl_lnk(src, trgt)
            vim.api.nvim_set_hl(0, src, { link = trgt })
          end

          hl_lnk('@constant.php', 'Purple')
          hl_lnk('@punctuation.bracket.php', 'Blue')
        end,
      })

      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
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
      -- vim.cmd.colorscheme 'vaporwave'
    end,
  },
}
