return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		--vim.g.gruvbox_material_enable_italic = true
		--vim.g.gruvbox_material_disable_italic_comment = true
		--vim.g.gruvbox_material_background = "soft"
		--vim.g.gruvbox_material_foreground = "mix"
		--vim.g.gruvbox_material_ui_contrast = "high"
		vim.cmd.colorscheme("everforest")
	end,
}
