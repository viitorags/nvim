return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local vue_language_server_path
      if require('nixCatsUtils').isNixCats == true then
        vue_language_server_path = vim.fs.dirname(vim.fn.exepath 'vue-language-server')
          .. '/../lib/language-tools/packages/language-server/node_modules/@vue/typescript-plugin'
      else
        vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
      end

      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      local lsp_servers = {
        html = {
          filetypes = { 'html', 'ejs', 'php' },
          capabilities = capabilities,
        },

        cssls = { capabilities = capabilities },

        emmet_ls = {
          filetypes = { 'html', 'javascript', 'markdown', 'php' },
          capabilities = capabilities,
        },

        vtsls = {
          cmd = { 'vtsls', '--stdio' },
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          root_markers = {
            'tsconfig.json',
            'package.json',
            'jsconfig.json',
            '.git',
          },
          settings = {
            vtsls = {
              tsserver = {
                maxTsServerMemory = 1024,
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = false,
                  },
                },
                watchOptions = {
                  watchFile = 'useFsEvents',
                  watchDirectory = 'useFsEvents',
                },
                globalPlugins = { vue_plugin },
              },
            },
          },
        },

        intelephense = { capabilities = capabilities },

        phpactor = {
          capabilities = capabilities,
          init_options = {
            ['language_server_phpstan.enabled'] = false,
            ['language_server_psalm.enabled'] = false,
          },
          handlers = {
            ['textDocument/publishDiagnostics'] = function() end,
            ['textDocument/hover'] = function() end,
            ['textDocument/signatureHelp'] = function() end,
            ['textDocument/definition'] = function() end,
            ['textDocument/references'] = function() end,
          },
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },

        gopls = {
          capabilities = capabilities,
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },

        tailwindcss = {
          filetypes = {
            'html',
            'css',
            'scss',
            'javascriptreact',
            'typescriptreact',
            'vue',
          },
          root_dir = require('lspconfig').util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
        },

        cmake = { capabilities = capabilities },

        clangd = {
          filetypes = { 'c', 'cpp' },
          cmd = { 'clangd', '--compile-commands-dir=.' },
          capabilities = capabilities,
          init_options = {
            clangdFileStatus = true,
            inlayHints = {
              enable = true,
              parameterNames = true,
              parameterTypes = true,
              variableTypes = true,
            },
          },
        },

        nixd = { capabilities = capabilities },

        lua_ls = {
          filetypes = { 'lua' },
          capabilities = capabilities,
          settings = {
            Lua = {
              hint = {
                enable = true,
              },
              diagnostics = {
                globals = {
                  'vim',
                  'require',
                  'Snacks',
                  'Laravel',
                  'state',
                },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },

        bashls = { capabilities = capabilities },

        marksman = { capabilities = capabilities },

        jsonls = { capabilities = capabilities },

        pyright = { capabilities = capabilities },

        qmlls = { capabilities = capabilities },

        jdtls = { capabilities = capabilities },
      }

      for server_name, config in pairs(lsp_servers) do
        local lsp_server = '' .. server_name
        vim.lsp.config(lsp_server, config)
        vim.lsp.enable(server_name)
      end
    end,
  },
}
