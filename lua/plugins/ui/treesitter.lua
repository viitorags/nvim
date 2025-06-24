return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        version = "*",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "tree-sitter/tree-sitter-embedded-template",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                sync_install = false,
                ignore_install = {},
                auto_install = true,
                ensure_installed = {
                    "c",
                    "lua",
                    "css",
                    "html",
                    "cpp",
                    "c_sharp",
                    "javascript",
                    "java",
                    "nix",
                    "markdown",
                    "json",
                    "yaml",
                    "python",
                    "go",
                },

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enable = true,
                },

                autotag = {
                    enable = true,
                },

                fold = {
                    enable = true,
                },

                playground = {
                    enable = false,
                },
                modules = {},
            })
        end,
    },
}
