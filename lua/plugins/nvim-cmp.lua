return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            -- Auto Completar
            "L3MON4D3/LuaSnip",
        },
        config = function()
            -- require'nvim-cmp'.setup()
            -- Configuração do nvim-cmp
            local cmp = require('cmp')

            cmp.setup({
                view = {
                    entries = "custom",
                },
    
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
        
                performance = {
                    max_view_entries = 10,
                    debounce = 120,
                },

                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
                -- Teclas para navegação e seleção
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Selecionar item anterior
                    ['<C-n>'] = cmp.mapping.select_next_item(),  -- Selecionar item seguinte
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar seleção
                    ['<C-e>'] = cmp.mapping.abort(),  -- Fechar o menu de sugestões
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                    -- Fontes de completamento (como LSP, buffer, etc.)
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip'},
                    { name = "treesitter"},
                    { name = 'path' },
                },
            })
        end,
    }
}
