return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
			auto_close = true,
			focus = "list",
			tree = true,
			follow_file = true,
			layout = { preset = "sidebar", preview = true },
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						layout = {
							position = "right",
							width = 35,
						},
					},
				},
			},
		},
		image = {
			enabled = true,
			formats = {
				"png",
				"jpg",
				"jpeg",
				"gif",
				"bmp",
				"webp",
				"tiff",
				"heic",
				"avif",
				"mp4",
				"mov",
				"avi",
				"mkv",
				"webm",
				"pdf",
			},
		},
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = false },
		zen = {
			enabled = true,
			toggles = {
				ufo = true,
			},
			config = function(_, opts)
				require("snacks").setup(opts)

				Snacks.toggle.new({
					id = "ufo",
					name = "Enable/Disable Ufo",
					get = function()
						return require("ufo").inspect()
					end,
					set = function()
						if state == nil then
							require("noice").enable()
							require("ufo").enable()
							vim.o.foldenable = true
							vim.o.foldcolumn = "1"
						else
							require("noice").disable()
							require("ufo").disable()
							vim.o.foldenable = false
							vim.o.foldcolumn = "0"
						end
					end,
				})
			end,
		},
		styles = {

			input = {
				backdrop = false,
				position = "float",
				border = "rounded",
				title_pos = "center",
				height = 1,
				width = 60,
				relative = "editor",
				noautocmd = true,
				row = 2,
				wo = {
					winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
					cursorline = false,
				},
				bo = {
					filetype = "snacks_input",
					buftype = "prompt",
				},
				b = {
					completion = false, -- disable blink completions in input
				},
				keys = {
					n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
					i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
					i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
					i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
					i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
					i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
					i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
					q = "cancel",
				},
			},

			lazygit = {},

			help = {
				position = "float",
				backdrop = false,
				border = "top",
				row = -1,
				width = 0,
				height = 0.3,
			},
		},
	},
	keys = {
		-- File Explorer
		{
			"<A-b>",
			function()
				Snacks.explorer()
			end,
			desc = "Open Explorer",
		},
		-- Top Pickers & Explorer
		{
			"<C-f>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>s",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
}
