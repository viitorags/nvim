return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_enable_bold = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
