return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_better_performance = true
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_enable_bold = true
            -- vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "sainnhe/everforest",
        priority = 1000,
        config = function()
            vim.g.everforest_background = "medium"
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_better_performance = 1
            vim.g.everforest_inlay_hints_background = "dimmed"
            vim.cmd.colorscheme("everforest")
        end,
    },
}
