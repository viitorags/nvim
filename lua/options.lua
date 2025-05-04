local options = {
	clipboard = "unnamedplus",
	mouse = "a",
	expandtab = false,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	termguicolors = true,
	wrap = false,
	smartindent = true,
	showmatch = true,
	completeopt = { "menuone", "noselect" },
	foldenable = true,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 99,
	signcolumn = "yes",
	wildmenu = true,
	wildmode = "longest:full,full",
	backup = false,
	swapfile = false,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	scrolloff = 8,
	sidescrolloff = 8,
	hlsearch = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "nix" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})
