M = {}

local function load_config()
	local surround = require("nvim-surround")

	surround.setup({})
end

M.lazy = {
	"kylechui/nvim-surround",
	version = "*",
	config = load_config,
	event = "VeryLazy",
}

return M.lazy
