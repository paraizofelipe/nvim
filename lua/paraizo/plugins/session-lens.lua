M = {}

local function load_config()
	local session_lens = require("session-lens")
	session_lens.setup({
		path_display = { "shorten" },
		theme = "ivy",
		theme_conf = { border = true },
		previewer = true,
	})
end

M.lazy = {
	"rmagatti/session-lens",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"rmagatti/auto-session",
	},
	config = load_config,
	lazy = false,
}

return M.lazy
