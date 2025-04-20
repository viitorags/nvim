local options = {
    clipboard = "unnamedplus",
    mouse = "a",
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    termguicolors = true,
    wrap = false,
    smartindent = true,
    showmatch = true,
    completeopt = { "menuone", "noselect" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
