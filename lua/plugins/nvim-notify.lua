return {
	{
		"rcarriga/nvim-notify",
		priority = 99999, -- Prioridade alta para carregar primeiro
		config = function()
			local notify = require("notify")
			notify.setup({
				level = vim.log.levels.INFO,
				timeout = 5,
				stages = "fade_in_slide_out",
				max_width = 90,
				background_colour = "#ffffff",
				top_down = false,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
			})
		end,
	},
}
