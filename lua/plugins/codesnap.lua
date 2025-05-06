return {
	"mistricky/codesnap.nvim",
	event = "BufReadPre",
	build = "make",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Imagens" },
	},
	opts = {
		save_path = "~/Imagens/CodeScreenshots",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
	},
}
