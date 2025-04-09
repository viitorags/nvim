return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        version = "*",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "css", "html", "cpp", "javascript", "java" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    }
}
