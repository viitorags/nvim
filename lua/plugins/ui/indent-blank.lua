return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = {
            char = "┆",
            highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            },
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            },
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#d8a657" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7daea3" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a9b665" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d3869b" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89b482" })
        end)

        require("ibl").setup(opts)
    end,
}
