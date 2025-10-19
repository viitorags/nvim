return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup {
      preset = 'ghost',
      options = {
        show_source = {
          enabled = true,
          if_many = false,
        },
        multilines = {
          enabled = true,
          always_show = true,
        },
      },
    }
  end,
}
