local opts = { noremap = true, silent = true }
local ui = require("util.ui")

-- Definir função de keymap
local keymap = vim.keymap.set

-- Mapeamento para copiar para a área de transferência
keymap("n", "<C-c>", '"+y', opts)
keymap("v", "<C-c>", '"+y', opts)

-- Mapeamento para salvar as alterações
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<C-o>:w<CR>", opts)

-- Mapeamento para abrir o explorador de arquivos
--keymap("n", "<Space>e", ":Neotree toggle<CR>", opts)

-- Mapeamento para trocar de Buffer
for i = 1, 9 do
    keymap("n", "<A-" .. i .. ">", function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        if buffers[i] then
            vim.cmd("buffer " .. buffers[i].bufnr)
        end
    end)
end

-- Mapeamento para fechar buffer atual
keymap("n", "<C-q>", ui.bufremove, { desc = "Delete Buffer" }, opts)

-- Mapeamento para abrir o Terminal
keymap("n", "<Space>v", ":ToggleTerm<CR>", opts)

-- Mapeamento para abrir o Lazygit
function Lazygit_toggle()
    local term = require("toggleterm.terminal").Terminal
    local lazygit = term:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
    })
    lazygit:toggle()
end

keymap("n", "<Space>g", ":lua Lazygit_toggle()<CR>", opts)
