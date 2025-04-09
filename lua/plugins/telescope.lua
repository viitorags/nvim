return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            local actions = require('telescope.actions')
            
            require('telescope').setup{
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = actions.which_key,
                        },
                    },
                },
            }
        end,
    }
}
