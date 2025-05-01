return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate", -- Garante que as linguagens serão atualizadas automaticamente
		version = "*",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				-- Especifique as linguagens a serem instaladas
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

				-- Ativa o destaque de sintaxe baseado em árvores de sintaxe
				highlight = {
					enable = true, -- Habilita o recurso de highlight
					additional_vim_regex_highlighting = false, -- Evita conflitos com o highlight padrão do Vim
				},

				-- Habilita a indentação baseada em árvores de sintaxe
				indent = {
					enable = true, -- Ativa a indentação inteligente
				},

				autotag = {
					enable = true,
				},

				-- Configuração de folding baseada em árvores de sintaxe
				fold = {
					enable = true, -- Ativa o folding
				},

				-- Configuração do módulo de playground (útil para depuração de árvore de sintaxe)
				playground = {
					enable = false, -- Desabilitado por padrão; ative se necessário
				},
			})

			-- Configuração adicional para folding
			vim.opt.foldmethod = "expr" -- Usa expressão para folding
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Usa Treesitter como expressão de folding
			vim.opt.foldlevel = 99 -- Abre todos os folds por padrão
		end,
	},
}
