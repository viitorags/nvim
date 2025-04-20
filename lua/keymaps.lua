local opts = { noremap = true, silent = true }

-- Definir função de keymap
local keymap = vim.keymap.set

-- Mapeamento para copiar para a área de transferência
keymap("n", "<C-c>", '"+y', opts)  
keymap("v", "<C-c>", '"+y', opts)  

-- Mapeamento para colar da área de transferência
keymap("n", "<C-v>", '"+p', opts)  
keymap("v", "<C-v>", '"+p', opts)  

-- Mapeamento para salvar as alterações
keymap("n", "<C-s>", ":w<CR>", opts)

-- Mapeamento para trocar de Buffer
for i = 1, 9 do
    keymap("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>")
end

-- Mapeamento para o Telescope
keymap("n", "<Space>f", ":Telescope find_files<CR>", opts)

-- Mapeamento para abrir o Nvim Tree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts) 

-- Mapeamento para abrir o Terminal
keymap("n", "<Space>v", ":ToggleTerm<CR>", opts)

-- Lazygit
function _lazygit_toggle()
  local term = require("toggleterm.terminal").Terminal
  local lazygit = term:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
  })
  lazygit:toggle()
end

keymap("n", "<Space>g", ":lua _lazygit_toggle()<CR>", opts)

-- Mapeamento para formatar usando o Prettier
keymap('n', '<C-f>', ':PrettierAsync<CR>', opts)
