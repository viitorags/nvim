return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_ui_contrast = "high"
        end,
    },
    {
        "sainnhe/everforest",
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
}
