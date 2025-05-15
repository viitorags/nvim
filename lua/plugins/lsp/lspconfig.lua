return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.cmake.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.html.setup({
                filetypes = { "html", "ejs" },
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.emmet_ls.setup({ capabilities = capabilities })
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
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
        end,
    },
}
