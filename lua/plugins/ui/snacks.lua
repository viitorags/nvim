return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    dashboard = { enabled = false },
    indent = {
      priority = 1,
      enabled = true,
      indent = {
        char = '┊',
        hl = {
          'SnacksIndent1',
          'SnacksIndent2',
          'SnacksIndent3',
          'SnacksIndent4',
          'SnacksIndent5',
          'SnacksIndent6',
          'SnacksIndent7',
          'SnacksIndent8',
        },
      },
      scope = {
        enabled = true,
        priority = 200,
        char = '┊',
        underline = false,
        only_current = false,
        hl = 'SnacksIndentScope', ---@type string|string[] hl group for scopes
      },
    },
    statuscolumn = {
      enabled = true,
      left = { --[[ "mark", "sign" ]]
      },
      right = { 'fold', 'git' },
      folds = {
        open = true,
        git_hl = true,
      },
      git = {
        patterns = { 'GitSign', 'MiniDiffSign' },
      },
      refresh = 50,
    },
    terminal = { enabled = false },
    input = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
      tree = true,
      follow_file = true,
    },
    picker = {
      enabled = true,
      ui_select = true,
      sources = {
        explorer = {
          replace_netrw = true,
          tree = true,
          follow_file = true,
          focus = 'list',
          watch = true,
          diagnostics = false,
          diagnostics_open = false,
          git_status = true,
          git_status_open = false,
          git_untracked = true,
          layout = {
            layout = {
              position = 'right',
            },
            preview = false,
          },
        },
      },
    },
    image = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    words = { enabled = false },
    bigfile = { enabled = false },
    git = { enabled = true },
    gitbrowser = { enabled = true },
    zen = { enabled = false },
    styles = {
      input = {
        backdrop = false,
        position = 'float',
        border = 'rounded',
        title_pos = 'center',
        height = 1,
        width = 60,
        relative = 'editor',
        noautocmd = true,
        row = 2,
        wo = {
          winhighlight = 'NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle',
          cursorline = false,
        },
        bo = {
          filetype = 'snacks_input',
          buftype = 'prompt',
        },
        b = {
          completion = false,
        },
        blame_line = {
          width = 0.6,
          height = 0.6,
          border = 'rounded',
          title = ' Git Blame ',
          title_pos = 'center',
          ft = 'git',
        },
        keys = {
          n_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'n', expr = true },
          i_esc = { '<esc>', { 'cmp_close', 'stopinsert' }, mode = 'i', expr = true },
          i_cr = { '<cr>', { 'cmp_accept', 'confirm' }, mode = { 'i', 'n' }, expr = true },
          i_tab = { '<tab>', { 'cmp_select_next', 'cmp' }, mode = 'i', expr = true },
          i_ctrl_w = { '<c-w>', '<c-s-w>', mode = 'i', expr = true },
          i_up = { '<up>', { 'hist_up' }, mode = { 'i', 'n' } },
          i_down = { '<down>', { 'hist_down' }, mode = { 'i', 'n' } },
          q = 'cancel',
        },
      },

      float = {
        position = 'float',
        backdrop = 60,
        height = 0.9,
        width = 0.9,
        zindex = 50,
      },

      zoom_indicator = {
        text = '▍ zoom  󰊓  ',
        minimal = true,
        enter = false,
        focusable = false,
        height = 1,
        row = 0,
        col = -1,
        backdrop = false,
      },

      help = {
        position = 'float',
        backdrop = false,
        border = 'top',
        row = -1,
        width = 0,
        height = 0.3,
      },
    },
  },
  keys = {
    -- File Explorer
    {
      '<leader>e',
      function()
        local explorer_pickers = Snacks.picker.get { source = 'explorer' }
        for _, v in pairs(explorer_pickers) do
          if v:is_focused() then
            v:close()
          else
            v:focus()
          end
        end
        if #explorer_pickers == 0 then
          Snacks.picker.explorer()
        end
      end,
      desc = 'Open Explorer',
    },
    -- Top Pickers & Explorer
    {
      '<leader>f',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>b',
      function()
        Snacks.picker.buffers()
      end,
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>v',
      function()
        Snacks.terminal()
      end,
      desc = 'Open terminal',
    },
    {
      '<leader>g',
      function()
        Snacks.lazygit()
      end,
      desc = 'Open lazygit in terminal',
    },
  },
}
