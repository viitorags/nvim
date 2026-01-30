return {
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
        },
      }
    end,
  },
  {
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    version = false,
    opts = {
      instructions_file = 'avante.md',
      provider = 'copilot',
      mode = 'agentic',
      providers = {
        copilot = {
          model = 'claude-haiku-4.5',
          auto_select_model = false,
        },
      },
      hints = { enabled = true },
      behavior = {
        auto_suggestions = false,
      },
      windows = {
        position = 'left',
        wrap = true,
        width = 40,
      },
    },
    dependencies = {
      'pogyomo/winresize.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-mini/mini.pick',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'stevearc/dressing.nvim',
    },
  },
}
