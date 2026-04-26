return {
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup({
				logo = "auto",
				logo_tooltip = "Neovim",
				main_image = "language",   -- shows language icon, not just nvim logo
				client_id = "1157438221865717891",
				log_level = nil,
				debounce_timeout = 10,
				blacklist = {},
				file_assets = {},
				show_time = true,
				global_timer = false,

				editing_text = "Editing %s",
				file_explorer_text = "Browsing files",
				git_commit_text = "Committing...",
				plugin_manager_text = "Managing plugins",
				reading_text = "Reading %s",
				workspace_text = "In %s",
				line_number_text = "Line %s out of %s",

				-- Custom workspace overrides (optional, per-project)
				-- workspace_text = function(workspace)
				-- 	return "Working on " .. workspace
				-- end,
			})
		end,
	},
}
