local opts = { noremap = true, silent = true }
local ui = require("util.ui")

local map = vim.keymap.set

map("n", "<C-c>", '"+y', opts)
map("v", "<C-c>", '"+y', opts)

map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<C-o>:w<CR>", opts)

map("n", "<C-f>", ":%s/foo/bar", opts)
map("v", "<C-f>", ":s/foo/bar", opts)

map("n", "<Space>a", ":CodeCompanionChat Toggle<CR>", opts)
map("n", "<Space>ca", ":CodeCompanionActions<CR>", opts)

map("n", "<Space>f", ":Telescope find_files<CR>", opts)
map("n", "<Space>b", ":Telescope buffers<CR>", opts)

for i = 1, 9 do
    map("n", "<A-" .. i .. ">", function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        if buffers[i] then
            vim.cmd("buffer " .. buffers[i].bufnr)
        end
    end)
end

map("n", "<C-q>", ui.bufremove, { desc = "Delete Buffer" }, opts)

map("n", "<Space>v", ":ToggleTerm<CR>", opts)

map("n", "<C-p>", ":CreateProjectSelect<CR>", opts)

function Lazygit_toggle()
    local term = require("toggleterm.terminal").Terminal
    local lazygit = term:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
    })
    lazygit:toggle()
end

map("n", "<Space>g", ":lua Lazygit_toggle()<CR>", opts)
