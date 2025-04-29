return {

	-- Auto Complete {}, [], (), "", ''
	{
		"windwp/nvim-autopairs",
		opts = {},
	},

	-- Tema
	{
		{
			--"folke/tokyonight.nvim",
			"sainnhe/gruvbox-material",
			lazy = false,
			priority = 1000,
			config = function()
				vim.g.gruvbox_material_enable_italic = true
				vim.g.gruvbox_material_background = "soft"
				vim.g.gruvbox_material_foreground = "mix"
				vim.cmd.colorscheme("gruvbox-material")
			end,
		},
	},

	-- Atalho de teclados
	{
		"folke/which-key.nvim",
		opts = {},
	},

	-- Terminal Integrado
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	-- Indentação
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
				},

				indent = {
					enable = true,
				},
			})
		end,
	},

	-- Auto emparelhamento tags html
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
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

	-- APIs REST TEST
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<Space>Rs", desc = "Send request" },
			{ "<Space>Ra", desc = "Send all requests" },
			{ "<Space>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
		},
	},

	-- Visual Multi Linhas
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},

	-- Navegação no Terminal Kitty
	{
		"knubie/vim-kitty-navigator",
		build = "cp ./*.py ~/.config/kitty/",
	},

	-- CMD LINE Stylized
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
}
