return {
    {
        "zbirenbaum/copilot.lua",
        lazy = false,
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                },
            })
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/codecompanion-history.nvim",
        },
        opts = {
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.7-sonnet",
                            },
                        },
                    })
                end,
            },
            opts = {
                language = "pt-br",
            },
            display = {
                chat = {
                    show_settings = true,
                },
            },
            extensions = {
                history = {
                    enabled = true,
                    opts = {
                        auto_generate_title = true,
                        auto_save = true,
                        dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
                    },
                },
            },
        },
    },
}
