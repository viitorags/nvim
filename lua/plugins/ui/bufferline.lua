local ui = require("util.ui")

return {
    "akinsho/bufferline.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            numbers = "ordinal",
            close_command = ui.bufremove,
            right_mouse_command = ui.bufremove,
            indicator = {
                style = "icon",
                icon = "▎",
            },
            modified_icon = "●",
            close_close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "snacks_layout_box",
                    separator = true,
                },
            },
            always_show_bufferline = true,
            diagnostics_update_in_insert = false,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = "thin",
            enforce_regular_tabs = true,
        },
    },
}
