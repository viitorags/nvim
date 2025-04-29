local options = {
	clipboard = "unnamedplus",
	mouse = "a",
	expandtab = false,
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
	foldmethod = "indent",
	foldlevel = 99,
	foldenable = true,
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

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "nix" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})
