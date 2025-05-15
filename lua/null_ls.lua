return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Adicione suporte ao tipo de arquivo .ejs
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "javascript", "typescript", "css", "json", "ejs" },
                    extra_args = {
                        "--write",
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                        "--plugin",
                        "prettier-plugin-ejs",
                    },
                }),

                null_ls.builtins.formatting.nixfmt.with({
                    command = "nixfmt",
                }),
            },

            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            -- Formata com null-ls
                            vim.lsp.buf.format({ bufnr = bufnr })

                            -- Substitui tabs por 4 espaços
                            local view = vim.fn.winsaveview()
                            vim.cmd([[%s/\t/    /ge]])
                            vim.fn.winrestview(view)
                        end,
                    })
                end
            end,
        })
    end,
}
