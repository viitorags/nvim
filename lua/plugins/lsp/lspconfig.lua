return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.clangd.setup({
                cmd = { "clangd", "--compile-commands-dir=." },
                root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "CMakeLists.txt"),
                capabilities = capabilities,
            })
            lspconfig.cmake.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.html.setup({
                filetypes = { "html", "ejs" },
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
                filetypes = { "html", "javascript" },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                                "require",
                                "Snacks",
                                "state",
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            lspconfig.nixd.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.marksman.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- "clangd",
                    "cmake",
                    "pyright",
                    "html",
                    "cssls",
                    "ts_ls",
                    "jsonls",
                    "marksman",
                    "emmet_ls",
                    "lua_ls",
                    "bashls",
                    "docker_compose_language_service",
                    "dockerls",
                },
                automatic_installation = true,
                automatic_enable = true,
            })
        end,
    },
}
