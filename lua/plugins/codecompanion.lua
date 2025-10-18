return {
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
        },
      }
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/codecompanion-history.nvim',
      'ravitemer/mcphub.nvim',
    },
    opts = {
      adapters = {
        http = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-3.7-sonnet',
                },
              },
            })
          end,
        },
      },
      opts = {
        language = 'pt-br',
      },
      display = {
        chat = {
          show_settings = true,
        },
      },
      strategies = {
        chat = {
          tools = {
            groups = {
              ['github_pr_workflow'] = {
                description = 'GitHub operations from issue to PR',
                tools = {
                  -- File operations
                  'neovim__read_multiple_files',
                  'neovim__write_file',
                  'neovim__edit_file',
                  -- GitHub operations
                  'github__list_issues',
                  'github__get_issue',
                  'github__get_issue_comments',
                  'github__create_issue',
                  'github__create_pull_request',
                  'github__get_file_contents',
                  'github__create_or_update_file',
                  'github__search_code',
                },
              },
            },
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            -- MCP Tools
            make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true, -- Show tool results directly in chat buffer
            format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
            -- MCP Resources
            make_vars = true, -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true, -- Add MCP prompts as /slash commands
          },
        },
        history = {
          enabled = true,
          opts = {
            auto_generate_title = true,
            auto_save = true,
            dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
          },
        },
      },
    },
  },
}
