return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "pyright" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			sh = { "shfmt" },
			nix = { "alejandra" },
		},
	},
}
