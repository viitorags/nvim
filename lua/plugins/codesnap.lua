return {
	"mistricky/codesnap.nvim",
	event = "BufReadPre",
	build = "make",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
	},
	opts = {
		save_path = "~/Pictures/Codescreenshots",
		has_breadcrumbs = true,
		bg_theme = "grape",
	},
}
