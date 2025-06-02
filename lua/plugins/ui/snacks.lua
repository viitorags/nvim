return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        dashboard = {
            enabled = true,
            preset = {
                header = [[
     ██╗ ██████╗ ██╗   ██╗██████╗  ██████╗ ██╗   ██╗
     ██║██╔═══██╗╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗ ██╔╝
     ██║██║   ██║ ╚████╔╝ ██████╔╝██║   ██║ ╚████╔╝ 
██   ██║██║   ██║  ╚██╔╝  ██╔══██╗██║   ██║  ╚██╔╝  
╚█████╔╝╚██████╔╝   ██║   ██████╔╝╚██████╔╝   ██║   
 ╚════╝  ╚═════╝    ╚═╝   ╚═════╝  ╚═════╝    ╚═╝   
                ]],
                keys = {
                    { icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "p",
                        desc = "Project Folder",
                        action = ":e $HOME/Workspace/Projects/ | :cd %:p:h",
                    },
                    { icon = " ", key = "s", desc = "Settings", action = ":e $MYVIMRC | :cd %:p:h" },
                    {
                        icon = "󰒲 ",
                        key = "L",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
                {
                    section = "terminal",
                    cmd = "pokemon-colorscripts -n zygarde --no-title -s; sleep .1",
                    random = 10,
                    pane = 2,
                    indent = 4,
                    height = 25,
                },
            },
        },
        indent = {
            enabled = true,
            char = "│",
        },
        statuscolumn = {
            enabled = true,
            left = { "mark", "sign" }, -- priority of signs on the left (high to low)
            right = { "fold", "git" }, -- priority of signs on the right (high to low)
            folds = {
                open = true, -- show open fold icons
                git_hl = false, -- use Git Signs hl for fold icons
            },
            git = {
                -- patterns to match Git signs
                patterns = { "GitSign", "MiniDiffSign" },
            },
            refresh = 50,
        },
        terminal = {
            enabled = false,
        },
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
                    focus = "list",
                    watch = true,
                    diagnostics = false,
                    diagnostics_open = false,
                    git_status = true,
                    git_status_open = false,
                    git_untracked = true,
                    layout = {
                        layout = {
                            position = "right",
                        },
                        preview = false,
                    },
                    win = {
                        list = {
                            keys = {
                                ["."] = "tcd",
                            },
                        },
                    },
                },
            },
            previewers = {
                diff = {
                    builtin = true,
                    cmd = { "delta" },
                },
                git = {
                    builtin = true,
                    args = {},
                },
                file = {
                    max_size = 1024 * 1024,
                    max_line_length = 500,
                    ft = nil,
                },
                man_pager = nil,
            },
            icons = {
                git = {
                    enabled = true, -- show git icons
                    commit = "󰜘 ", -- used by git log
                    staged = "●", -- staged changes. always overrides the type icons
                    added = "",
                    deleted = "",
                    ignored = " ",
                    modified = "○",
                    renamed = "",
                    unmerged = " ",
                    untracked = "?",
                },
                diagnostics = {
                    Error = " ",
                    Warn = " ",
                    Hint = " ",
                    Info = " ",
                },
                lsp = {
                    unavailable = "",
                    enabled = " ",
                    disabled = " ",
                    attached = "󰖩 ",
                },
                kinds = {
                    Array = " ",
                    Boolean = "󰨙 ",
                    Class = " ",
                    Color = " ",
                    Control = " ",
                    Collapsed = " ",
                    Constant = "󰏿 ",
                    Constructor = " ",
                    Copilot = " ",
                    Enum = " ",
                    EnumMember = " ",
                    Event = " ",
                    Field = " ",
                    File = " ",
                    Folder = " ",
                    Function = "󰊕 ",
                    Interface = " ",
                    Key = " ",
                    Keyword = " ",
                    Method = "󰊕 ",
                    Module = " ",
                    Namespace = "󰦮 ",
                    Null = " ",
                    Number = "󰎠 ",
                    Object = " ",
                    Operator = " ",
                    Package = " ",
                    Property = " ",
                    Reference = " ",
                    Snippet = "󱄽 ",
                    String = " ",
                    Struct = "󰆼 ",
                    Text = " ",
                    TypeParameter = " ",
                    Unit = " ",
                    Unknown = " ",
                    Value = " ",
                    Variable = "󰀫 ",
                },
            },
        },
        image = {
            enabled = false,
            formats = {
                "png",
                "jpg",
                "jpeg",
                "gif",
                "bmp",
                "webp",
                "tiff",
                "heic",
                "avif",
                "mp4",
                "mov",
                "avi",
                "mkv",
                "webm",
                "pdf",
            },
        },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        scope = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = false },
        bigfile = { enabled = false },
        git = { enabled = true },
        gitbrowser = { enabled = true },
        zen = {
            enabled = false,
        },
        styles = {

            input = {
                backdrop = false,
                position = "float",
                border = "rounded",
                title_pos = "center",
                height = 1,
                width = 60,
                relative = "editor",
                noautocmd = true,
                row = 2,
                wo = {
                    winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
                    cursorline = false,
                },
                bo = {
                    filetype = "snacks_input",
                    buftype = "prompt",
                },
                b = {
                    completion = false, -- disable blink completions in input
                },
                blame_line = {
                    width = 0.6,
                    height = 0.6,
                    border = "rounded",
                    title = " Git Blame ",
                    title_pos = "center",
                    ft = "git",
                },
                keys = {
                    n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                    i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
                    i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
                    i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
                    i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
                    i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
                    i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
                    q = "cancel",
                },
            },

            lazygit = {},

            float = {
                position = "float",
                backdrop = 60,
                height = 0.9,
                width = 0.9,
                zindex = 50,
            },

            zoom_indicator = {
                text = "▍ zoom  󰊓  ",
                minimal = true,
                enter = false,
                focusable = false,
                height = 1,
                row = 0,
                col = -1,
                backdrop = false,
            },

            help = {
                position = "float",
                backdrop = false,
                border = "top",
                row = -1,
                width = 0,
                height = 0.3,
            },
        },
    },
    keys = {
        -- File Explorer
        {
            "<leader>e",
            function()
                local explorer_pickers = Snacks.picker.get({ source = "explorer" })
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
            desc = "Open Explorer",
        },
        -- Top Pickers & Explorer
        {
            "<leader>f",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers()
            end,
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
    },
}
