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
            "uZer/pywal16.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("pywal16")
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

    -- Formatação
    {
        "prettier/vim-prettier",
        config = function ()
        end,
    },

    -- Caixas de cor
    {
        "catgoose/nvim-colorizer.lua",
        opts = {
            filetypes = { "*" },
        },
    },

    -- Visual Multi Linhas
    {
        "mg979/vim-visual-multi",
        branch = "master",
    }

}
