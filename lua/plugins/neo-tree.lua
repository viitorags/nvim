return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		sources = { "filesystem", "git_status", "document_symbols" },
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		popup_border_style = "solid",
		use_popups_for_input = false,
		enable_modified_markers = true,
		enable_diagnostics = true,
		sort_case_insensitive = true,
		source_selector = {
			winbar = true,
			statusline = false,
			tabs_layout = "equal",

			sources = {
				{ source = "filesystem" },
				{ source = "document_symbols" },
				{ source = "git_status" },
			},

			separator = { left = "▏", right = "▕" },
			highlight_tab = "NeoTreeTabInactive",
			highlight_tab_active = "NeoTreeTabActive",
			highlight_background = "NeoTreeTabInactive",
			highlight_separator = "NeoTreeTabSeparatorInactive",
			highlight_separator_active = "NeoTreeTabSeparatorActive",
		},
		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 1,
				highlight = "NeoTreeIndentMarker",
				with_markers = true,
				with_expanders = true,
				expander_highlight = "NeoTreeExpander",
			},

			modified = {
				symbol = " ",
				highlight = "NeoTreeModified",
			},
			git_status = {
				symbols = {
					-- Change type
					added = " ",
					deleted = " ",
					modified = " ",
					renamed = " ",
					--Status type
					untracked = " ",
					ignored = " ",
					unstaged = " ",
					staged = " ",
					conflict = " ",
				},

				window = {
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
						["i"] = "show_file_details",
						["b"] = "rename_basename",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
					},
				},
			},

			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
					},
				},
			},
		},

		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = {
					"node_modules",
				},
			},
			follow_current_file = { enabled = true },
			group_empty_dirs = true,
			hijack_netrw = false,
			use_libuv_file_watcher = true,

			window = {
				mappings = {
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
				},
			},
		},

		document_symbols = {
			follow_cursor = false,
			client_filters = "first",
			renderers = {
				root = {
					{ "indent" },
					{ "icon", default = "C" },
					{ "name", zindex = 10 },
				},
				symbol = {
					{ "indent", with_expanders = true },
					{ "kind_icon", default = "?" },
					{
						"container",
						content = {
							{ "name", zindex = 10 },
							{ "kind_name", zindex = 20, align = "right" },
						},
					},
				},
			},

			window = {
				mappings = {
					["/"] = "filter",
					["f"] = "filter_on_submit",
				},
			},

			kinds = {
				Unknown = { icon = "?", hl = "" },
				Root = { icon = "", hl = "NeoTreeRootName" },
				File = { icon = "󰈙", hl = "Tag" },
				Module = { icon = "", hl = "Exception" },
				Namespace = { icon = "󰌗", hl = "Include" },
				Package = { icon = "󰏖", hl = "Label" },
				Class = { icon = "󰌗", hl = "Include" },
				Method = { icon = "", hl = "Function" },
				Property = { icon = "󰆧", hl = "@property" },
				Field = { icon = "", hl = "@field" },
				Constructor = { icon = "", hl = "@constructor" },
				Enum = { icon = "󰒻", hl = "@number" },
				Interface = { icon = "", hl = "Type" },
				Function = { icon = "󰊕", hl = "Function" },
				Variable = { icon = "", hl = "@variable" },
				Constant = { icon = "", hl = "Constant" },
				String = { icon = "󰀬", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Boolean = { icon = "", hl = "Boolean" },
				Array = { icon = "󰅪", hl = "Type" },
				Object = { icon = "󰅩", hl = "Type" },
				Key = { icon = "󰌋", hl = "" },
				Null = { icon = "", hl = "Constant" },
				EnumMember = { icon = "", hl = "Number" },
				Struct = { icon = "󰌗", hl = "Type" },
				Event = { icon = "", hl = "Constant" },
				Operator = { icon = "󰆕", hl = "Operator" },
				TypeParameter = { icon = "󰊄", hl = "Type" },
			},
		},

		window = {
			position = "right",
			width = 35,
			mappings = {
				["<space>"] = "none",
				["h"] = "toggle_node",
				["l"] = "open",
				["s"] = "open_rightbelow_vs",
				["<"] = "prev_source",
				[">"] = "next_source",
				["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
				["<C-z>"] = { "scroll_preview", config = { direction = 10 } },
				["<C-x>"] = { "scroll_preview", config = { direction = -10 } },
				["<space>z"] = {
					function()
						require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
					end,
				},
				["O"] = {
					function(state)
						require("lazy.util").open(state.tree:get_node().path, { system = true })
					end,
					desc = "Open with System Application",
				},
			},
		},
	},
}
