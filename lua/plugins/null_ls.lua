-- plugins/null-ls.lua
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

                -- JS / TS / JSON / HTML / CSS
                null_ls.builtins.formatting.prettier.with({
                    extra_args = {
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                    },
                }),

                -- Nix
                null_ls.builtins.formatting.nixfmt.with({
                    command = "nixfmt-rfc-style",
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
                            local view = vim.fn.winsaveview() -- mantém posição do cursor
                            vim.cmd([[%s/\t/    /ge]])
                            vim.fn.winrestview(view)
                        end,
                    })
                end
            end,
        })
    end,
}
