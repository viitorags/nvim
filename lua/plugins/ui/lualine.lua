return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lazy_status = require("lazy.status")
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    always_divide_middle = true,
                    always_show_tabline = true,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            icon = " ",
                            padding = {
                                left = 1,
                                right = 1,
                            },
                        },
                    },
                    lualine_b = {
                        { "branch", icon = "" },
                    },
                    lualine_c = {
                        { "filetype", icons_enabled = true },
                        {
                            "filename",
                            path = 1,
                            symbols = { modified = " [+]", readonly = " [RO]" },
                        },
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = { error = " ", warn = " ", info = " ", hint = " " },
                            colored = true,
                            update_in_insert = true,
                            always_visible = true,
                        },
                    },
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#fabd2f" },
                            icon = " ",
                            padding = { left = 1, right = 1 },
                        },
                    },
                    lualine_y = {
                        { "progress", icon = "" },
                    },
                    lualine_z = {
                        { "location", icon = "" },
                    },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        { "filename", path = 0, symbols = { modified = " [+]", readonly = " [RO]" } },
                    },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = { "neo-tree", "quickfix" },
            })
        end,
    },
}
