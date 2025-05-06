return {
	"voldikss/vim-translator",
	config = function()
		vim.g.translator_target_lang = "pt"
		vim.g.translator_default_engines = { "google" }
	end,
}
