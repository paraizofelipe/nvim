M = {}

local function load_config()
	local dbee = require("dbee")

	dbee.setup({})
end

M.lazy = {
	"kndndrj/nvim-dbee",
	config = load_config,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
}

return M.lazy
