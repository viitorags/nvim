return {
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                "                                                    ",
                "                                                    ",
                "                                                    ",
                "                                                    ",
                "     ██╗ ██████╗ ██╗   ██╗██████╗  ██████╗ ██╗   ██╗",
                "     ██║██╔═══██╗╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗ ██╔╝",
                "     ██║██║   ██║ ╚████╔╝ ██████╔╝██║   ██║ ╚████╔╝ ",
                "██   ██║██║   ██║  ╚██╔╝  ██╔══██╗██║   ██║  ╚██╔╝  ",
                "╚█████╔╝╚██████╔╝   ██║   ██████╔╝╚██████╔╝   ██║   ",
                " ╚════╝  ╚═════╝    ╚═╝   ╚═════╝  ╚═════╝    ╚═╝   ",
            }
            -- Highlights
            vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#8ec07c", bold = true })
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fabd2f", bold = true })
            vim.api.nvim_set_hl(0, "AlphaButtonIcon", { fg = "#d3869b", bold = true })
            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#fe8019", bold = true })
            vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#fb4934", italic = true })

            local function colored_button(sc, txt, cmd)
                local btn = require("alpha.themes.dashboard").button(sc, txt, cmd)
                btn.opts.hl = "AlphaButtons"
                btn.opts.hl_shortcut = "AlphaShortcut"
                btn.opts.hl_icon = "AlphaButtonIcon"
                return btn
            end

            dashboard.section.buttons.val = {
                colored_button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                colored_button("f", "󰈞  > Find file", ":lua Snacks.dashboard.pick('live_grep')<CR>"),
                colored_button("r", "  > Recent", ":lua Snacks.dashboard.pick('oldfiles')<CR>"),
                colored_button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
                colored_button("p", "  > Folder projects", ":e $HOME/Workspace/Projects/ | :cd %:p:h<CR>"),
                colored_button("l", "󰒲  > Lazy", ":Lazy<CR>"),
                colored_button("q", "  > Quit NVIM", ":qa<CR>"),
            }

            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"

            local lazy_stats = require("lazy").stats()
            dashboard.section.footer.val = {
                "If You Don't Take Risks, You Can't Create a Future.",
                " ",
                "                                  - Monkey D. Luffy",
                " ",
                "             Plugins loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
            }

            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                desc = "disable tabline for alpha",
                callback = function()
                    vim.opt.showtabline = 0
                    vim.opt.laststatus = 0
                end,
            })

            require("alpha").setup(dashboard.config)
        end,
    },
}
