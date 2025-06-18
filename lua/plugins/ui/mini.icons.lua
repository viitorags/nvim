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
                ["pages"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
                ["views"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
                ["controllers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
                ["routes"] = { glyph = "󰾶", hl = "MiniIconsYellow" },
                ["js"] = { hl = "MiniIconsYellow" },
                ["services"] = { glyph = "󱧼", hl = "MiniIconsPurple" },
                ["config"] = { glyph = "󱁿", hl = "MiniIconsGreen" },
            },

            filetype = {
                ["javascript"] = { glyph = "" },
                ["css"] = { glyph = "" },
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
