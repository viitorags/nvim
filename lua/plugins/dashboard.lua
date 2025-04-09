return {
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
            local alpha = require("alpha").setup
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                "                                                      ",
                "    ▄▄▄██▀▀▀▒█████ ▓██   ██▓ ▄▄▄▄    ▒█████ ▓██   ██▓ ",
                "      ▒██  ▒██▒  ██▒▒██  ██▒▓█████▄ ▒██▒  ██▒▒██  ██▒ ",
                "      ░██  ▒██░  ██▒ ▒██ ██░▒██▒ ▄██▒██░  ██▒ ▒██ ██░ ",
                "   ▓██▄██▓ ▒██   ██░ ░ ▐██▓░▒██░█▀  ▒██   ██░ ░ ▐██▓░ ",
                "    ▓███▒  ░ ████▓▒░ ░ ██▒▓░░▓█  ▀█▓░ ████▓▒░ ░ ██▒▓░ ",
                "    ▒▓▒▒░  ░ ▒░▒░▒░   ██▒▒▒ ░▒▓███▀▒░ ▒░▒░▒░   ██▒▒▒  ",
                "    ▒ ░▒░    ░ ▒ ▒░ ▓██ ░▒░ ▒░▒   ░   ░ ▒ ▒░ ▓██ ░▒░  ",
                "    ░ ░ ░  ░ ░ ░ ▒  ▒ ▒ ░░   ░    ░ ░ ░ ░ ▒  ▒ ▒ ░░   ",
                "    ░   ░      ░ ░  ░ ░      ░          ░ ░  ░ ░      ",
                "                    ░ ░           ░          ░ ░      ",
                "                                                      ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button( "f", "󰈞  > Find file", ":cd $HOME | Telescope find_files<CR>"),
                dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
                dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                dashboard.button( "p", "  > Folder projects" , ":e $HOME/Workspace/Projetos/ | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
            }
            
            -- Set Footer
            local lazy_stats = require("lazy").stats()
            dashboard.section.footer.val = {
                "If You Don't Take Risks, You Can't Create a Future.",
                " ",
                "                                  - Monkey D. Luffy",
                " ",
                "             Plugins loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
            }

        end,
    }
}
