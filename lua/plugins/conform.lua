return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },

            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                sh = { "shfmt" },
                nix = { "nixfmt" },
                ejs = { "prettier" },
            },
        })

        -- Cria um autocomando que roda o formatter + substituição de tabs
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
                -- Formata com conform
                require("conform").format({ bufnr = args.buf })

                -- Substitui tabs por 4 espaços (preserva posição do cursor)
                local view = vim.fn.winsaveview()
                vim.cmd([[%s/\t/    /ge]])
                vim.fn.winrestview(view)
            end,
        })
    end,
}
