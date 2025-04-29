return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = actions.which_key,
						},
					},
					prompt_prefix = ">>> ",
					selection_caret = "> ",
					entry_prefix = "  ",
					initial_mode = "insert",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							preview_width = 0.6,
							prompt_position = "top",
						},
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,

					color_devicons = false,
					results_title = "",
					prompt_title = "",
					preview_title = "",

					border = true,
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					previewer = true,
				},
			})
		end,
	},
}
