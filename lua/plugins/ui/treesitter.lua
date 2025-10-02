return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = require('nixCatsUtils').lazyAdd ':TSUpdate',
    version = '*',
    dependencies = {
      'tree-sitter/tree-sitter-embedded-template',
    },
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        sync_install = false,
        ignore_install = {},
        auto_install = require('nixCatsUtils').lazyAdd(true, false),
        ensure_installed = require('nixCatsUtils').lazyAdd {
          'c',
          'lua',
          'css',
          'html',
          'cpp',
          'javascript',
          'rust',
          'java',
          'sql',
          'nix',
          'markdown',
          'json',
          'yaml',
          'python',
          'go',
          'php',
          'vue',
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        fold = {
          enable = true,
        },

        playground = {
          enable = false,
        },
        modules = {},
      }
    end,
  },
}
