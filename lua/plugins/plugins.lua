return {

    -- Auto Complete {}, [], (), "", ''
    {
        "windwp/nvim-autopairs",
        opts = {},
    },

    -- ScrollBar
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup();
        end,
    },

    -- Tema
    {
        {
            "ellisonleao/gruvbox.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("gruvbox")
            end,
        }
    },

    -- Atalho de teclados
    {
        "folke/which-key.nvim",
        opts = {},
    },

    -- Terminal Integrado
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },

    -- Indentação
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    -- Instalação LSP
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    -- Auto emparelhamento tags html
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },

    -- Caixas de cor
    {
        "catgoose/nvim-colorizer.lua",
        opts = {
            filetypes = { "*" },
        },
    }

}
