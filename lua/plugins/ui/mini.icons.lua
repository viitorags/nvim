return {
    {
        "echasnovski/mini.icons",
        opts = {
            directory = {
                ["public"] = { glyph = "󰉌", hl = "MiniIconsGreen" },
                ["images"] = { glyph = "󰉏", hl = "MiniIconsPurple" },
                ["icons"] = { glyph = "󰉏", hl = "MiniIconsPurple" },
                ["audio"] = { glyph = "󱍙", hl = "MiniIconsRed" },
                ["models"] = { glyph = "󱋣", hl = "MiniIconsRed" },
                ["Models"] = { glyph = "󱋣", hl = "MiniIconsRed" },
                ["model"] = { glyph = "󱋣", hl = "MiniIconsRed" },
                ["schemas"] = { glyph = "󱋣", hl = "MiniIconsRed" },
                ["schema"] = { glyph = "󱋣", hl = "MiniIconsRed" },
                ["pages"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
                ["views"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
                ["Views"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
                ["controllers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
                ["Controllers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
                ["handlers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
                ["handler"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
                ["routes"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
                ["Routes"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
                ["routers"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
                ["Routers"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
                ["router"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
                ["js"] = { hl = "MiniIconsYellow" },
                ["services"] = { glyph = "󱧼", hl = "MiniIconsPurple" },
                ["Services"] = { glyph = "󱧼", hl = "MiniIconsPurple" },
                ["config"] = { glyph = "󱁿", hl = "MiniIconsGreen" },
                ["Config"] = { glyph = "󱁿", hl = "MiniIconsGreen" },
                ["test"] = { hl = "MiniIconsRed" },
                [".git"] = { glyph = "", hl = "MiniIconsOrange" },
                ["scripts"] = { glyph = "󱁽", hl = "MiniIconsYellow" },
            },

            file = {
                ["docker-composer.yml"] = { glyph = "󰡨", hl = "MiniIconsRed" },
                ["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsRed" },
                ["go.mod"] = { glyph = "", hl = "MiniIconsPurple" },
                ["go.sum"] = { glyph = "", hl = "MiniIconsGreen" },
            },

            filetype = {
                ["javascript"] = { glyph = "", hl = "MiniIconsYellow" },
                ["css"] = { glyph = "", hl = "MiniIconsBlue" },
                ["go"] = { glyph = "", hl = "MiniIconsBlue" },
            },

            extension = {
                ["ejs"] = { glyph = " ", hl = "MiniIconsYellow" },
                ["rest"] = { glyph = "󱂛", hl = "MiniIconsRed" },
            },
        },
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}
