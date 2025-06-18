return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
