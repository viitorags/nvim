return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		version = "*",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"css",
					"html",
					"cpp",
					"javascript",
					"java",
					"nix",
					"markdown",
					"json",
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = {
					enable = true,
				},

				autotag = {
					enable = true,
				},

				fold = {
					enable = true,
				},

				playground = {
					enable = false,
				},
			})
		end,
	},
}
