M = {}

local function load_config() end

M.lazy = {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	version = "*",
	-- config = load_config,
	event = "VeryLazy",
}

return M.lazy
