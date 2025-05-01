return {

	-- Auto Complete {}, [], (), "", ''
	{
		"windwp/nvim-autopairs",
		opts = {},
	},

	-- Terminal Integrado
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	-- Formatação
	{
		"prettier/vim-prettier",
		config = function() end,
	},

	-- Caixas de cor
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			filetypes = { "html", "css", "js", "nix" },
		},
	},

	-- Visual Multi Linhas
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
}
