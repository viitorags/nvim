return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            -- require'nvim-cmp'.setup()
            -- Configuração do nvim-cmp
            local cmp = require("cmp")
            vim.api.nvim_set_hl(0, "CmpMenu", { bg = "none" })

            cmp.setup({
                view = {
                    entries = { name = "custom", selection_order = "top_down" },
                },

                completion = {
                    completeopt = "menu,menuone,noinsert",
                },

                performance = {
                    max_view_entries = 10,
                    debounce = 120,
                },

                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:PmenuSel,Search:None",
                        scrollbar = true,
                        border = "single",
                        winblend = 15,
                    }),

                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:PmenuSel,Search:None",
                        col_offset = 4,
                        border = "single",
                        winblend = 15,
                    }),
                },

                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind =
                            require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = " " .. (strings[2] or "") .. " "

                        return kind
                    end,
                },
                -- Teclas para navegação e seleção
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                -- Fontes de completamento (como LSP, buffer, etc.)
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "luasnip" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "treesitter" },
                    { name = "path" },
                },
            })
        end,
    },
}
