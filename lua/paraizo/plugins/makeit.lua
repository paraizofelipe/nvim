M = {}

local function load_config() end

M.lazy = {
	"Zeioth/makeit.nvim",
	cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
	dependencies = { "stevearc/overseer.nvim" },
	-- config = load_config,
	opts = {},
}

return M.lazy
