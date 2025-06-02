vim.lsp.config("roslyn", {
    cmd = {
        "Microsoft.CodeAnalysis.LanguageServer",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fn.stdpath("cache") .. "/roslyn_logs",
        "--stdio",
    },
    on_attach = function()
        print("This will run when the server attaches!")
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})
vim.lsp.enable("roslyn")

return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {
            capabilities = {
                textDocument = {
                    _vs_onAutoInsert = { dynamicRegistration = false },
                },
            },
            cmd = {
                "Microsoft.CodeAnalysis.LanguageServer",
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fn.stdpath("cache") .. "/roslyn_logs",
                "--stdio",
            },
            on_attach = function(client, bufnr)
                print("Roslyn LSP attached!")
                -- Outras configurações on_attach aqui
            end,
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                },
                ["csharp|code_lens"] = {
                    dotnet_enable_references_code_lens = true,
                },
            },
            capabilities = {
                textDocument = {
                    _vs_onAutoInsert = { dynamicRegistration = false },
                },
            },
            handlers = {
                ["textDocument/_vs_onAutoInsert"] = function(err, result, _)
                    if err or not result then
                        return
                    end
                    local edit = result._vs_textEdit

                    local bufnr = vim.api.nvim_get_current_buf()
                    local start_line = edit.range.start.line
                    local start_char = edit.range.start.character
                    local end_line = edit.range["end"].line
                    local end_char = edit.range["end"].character

                    local newText = string.gsub(edit.newText, "\r", "")
                    local lines = vim.split(newText, "\n")

                    local placeholder_row = -1
                    local placeholder_col = -1

                    -- placeholder handling
                    for i, line in ipairs(lines) do
                        local pos = string.find(line, "%$0")
                        if pos then
                            lines[i] = string.gsub(line, "%$0", "", 1)
                            placeholder_row = start_line + i - 1
                            placeholder_col = pos - 1
                            break
                        end
                    end

                    vim.api.nvim_buf_set_text(bufnr, start_line, start_char, end_line, end_char, lines)

                    if placeholder_row ~= -1 and placeholder_col ~= -1 then
                        local win = vim.api.nvim_get_current_win()
                        vim.api.nvim_win_set_cursor(win, { placeholder_row + 1, placeholder_col })
                    end
                end,
            },
        },
    },
}
