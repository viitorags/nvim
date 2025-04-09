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
    wrap = false,  -- Desativa a quebra de linha automática
    smartindent = true,  -- Ativa indentação inteligente
    showmatch = true,  -- Destaca parênteses e colchetes correspondentes
    completeopt = { "menuone", "noselect" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
