return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "gruvbox-material",
				component_separators = { left = "", right = "" }, -- Separadores visuais
				section_separators = { left = "", right = "" },
				globalstatus = true,
				always_divide_middle = true,
				always_show_tabline = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { { "mode", upper = true } }, -- Mostra o modo em caixa alta
				lualine_b = { { "branch", icon = "" } }, -- Mostra o branch com ícone do Git
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = " [+]", readonly = " [RO]" } }, -- Caminho relativo com símbolos
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " }, -- Ícones visuais para diagnósticos
						colored = true, -- Ativa a colorização dos diagnósticos
						update_in_insert = true, -- Atualiza em modo de inserção
						always_visible = true, -- Sempre exibe diagnósticos
					},
				},
				lualine_x = {
					"encoding",
					{ "fileformat", icons_enabled = true }, -- Mostra o formato do arquivo com ícones
					{ "filetype", icon_only = true }, -- Mostra apenas o ícone do tipo de arquivo
				},
				lualine_y = { "progress" }, -- Barra de progresso
				lualine_z = { { "location", icon = "" } }, -- Localização com ícone
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 0, symbols = { modified = " [+]", readonly = " [RO]" } } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
		},
		extensions = { "neo-tree", "quickfix" }, -- Extensões para integração com outros plugins
	},
}
