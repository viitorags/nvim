return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      lspconfig.clangd.setup {
        filetypes = { 'c', 'cpp' },
        cmd = { 'clangd', '--compile-commands-dir=.' },
        root_dir = require('lspconfig.util').root_pattern('compile_commands.json', 'CMakeLists.txt'),
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
      }
      lspconfig.cmake.setup { capabilities = capabilities }
      lspconfig.pyright.setup { capabilities = capabilities }
      lspconfig.html.setup {
        filetypes = { 'html', 'ejs', 'php' },
        capabilities = capabilities,
      }
      lspconfig.cssls.setup { capabilities = capabilities }
      lspconfig.emmet_ls.setup {
        filetypes = { 'html', 'javascript', 'markdown', 'php' },
        capabilities = capabilities,
      }
      lspconfig.lua_ls.setup {
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
      }
      lspconfig.gopls.setup {
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
      }
      lspconfig.nixd.setup { capabilities = capabilities }
      lspconfig.bashls.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        init_options = {
          preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      }
      lspconfig.docker_compose_language_service.setup { capabilities = capabilities }
      lspconfig.dockerls.setup { capabilities = capabilities }
      lspconfig.marksman.setup { capabilities = capabilities }
      lspconfig.jsonls.setup { capabilities = capabilities }
      lspconfig.intelephense.setup { capabilities = capabilities }
      lspconfig.qmlls.setup { capabilities = capabilities }

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
    end,
  },
}
