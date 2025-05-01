return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "┆",
			highlight = "IblIndent", -- Se o tema fornecer, será usado
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,

			highlight = { "IblScope" }, -- Também usa do tema
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
