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
                },

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
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
            })
        end,
    },
}
