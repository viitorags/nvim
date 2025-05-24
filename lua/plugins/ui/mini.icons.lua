return {
    {
        "echasnovski/mini.icons",
        opts = {
            directory = {
                ["public"] = { glyph = "󰉌 ", hl = "MiniIconsGreen" },
                ["images"] = { glyph = "󰉏 ", hl = "MiniIconsPurple" },
                ["icons"] = { glyph = "󰉏 ", hl = "MiniIconsPurple" },
                ["audio"] = { glyph = "󱍙 ", hl = "MiniIconsRed" },
                ["models"] = { glyph = "󱋣 ", hl = "MiniIconsYellow" },
                ["pages"] = { glyph = "󰴉 ", hl = "MiniIconsOrange" },
                ["views"] = { glyph = "󰴉 ", hl = "MiniIconsOrange" },
                ["controllers"] = { glyph = "󰢬 ", hl = "MiniIconsYellow" },
                ["routes"] = { glyph = "󰾶 ", hl = "MiniIconsYellow" },
                ["js"] = { hl = "MiniIconsYellow" },
            },

            filetype = {
                ["javascript"] = { glyph = " " },
                ["css"] = { glyph = "" },
                ["rest"] = { glyph = "󱂛 ", hl = "MiniIconsRed" },
            },

            extension = {
                ["ejs"] = { glyph = " ", hl = "MiniIconsYellow" },
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
