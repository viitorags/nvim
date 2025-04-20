return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons',},
        opts = {
            options = {
                theme = 'pywal16-nvim',
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'tabs', 'windows' },
                lualine_c = { 'branch', 'diff', 'diagnostics' },
                lualine_x = { 'encoding', 'fileformat' },
                lualine_y = { 'filetype' },
                lualine_z = { 'location'},
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        },
    }
}
