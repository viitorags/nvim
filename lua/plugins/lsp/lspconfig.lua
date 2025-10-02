return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local vue_language_server_path = vim.fs.dirname(vim.fn.exepath 'vue-language-server')
        .. '/../lib/language-tools/packages/language-server/node_modules/@vue/typescript-plugin'
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
                globalPlugins = { vue_plugin },
              },
            },
          },
        },

        vue_ls = {
          cmd = { 'vue-language-server', '--stdio' },
          filetypes = { 'vue' },
          settings = {
            typescript = {
              globalPlugins = { vue_plugin },
            },
          },
        },

        intelephense = { capabilities = capabilities },

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
          capabilities = capabilities,
          filetypes = {
            'aspnetcorerazor',
            'astro',
            'django-html',
            'htmldjango',
            'ejs',
            'gohtml',
            'gohtmltmpl',
            'handlebars',
            'html',
            'htmlangular',
            'html-eex',
            'markdown',
            'php',
            'razor',
            'css',
            'less',
            'postcss',
            'sass',
            'scss',
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
            'svelte',
            'templ',
          },
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
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })

      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          local function_hl = vim.api.nvim_get_hl(0, { name = 'Function' })
          local cursorline_hl = vim.api.nvim_get_hl(0, { name = 'CursorLine' })

          vim.api.nvim_set_hl(0, 'LspInlayHint', {
            fg = function_hl.fg and string.format('#%06x', function_hl.fg) or nil,
            bg = cursorline_hl.bg and string.format('#%06x', cursorline_hl.bg) or nil,
            italic = true,
          })
        end,
      })

      for server_name, config in pairs(lsp_servers) do
        local lsp_server = '' .. server_name
        vim.lsp.config(lsp_server, config)
        vim.lsp.enable(server_name)
      end
    end,
  },
}
