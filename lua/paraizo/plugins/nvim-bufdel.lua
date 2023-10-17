M = {}

local function load_config()
	require("bufdel").setup({
		next = "tabs",
		quit = true,
	})
end

M.lazy = {
	"ojroques/nvim-bufdel",
	config = load_config,
	cmd = { "BufDel" },
	lazy = true,
}

return M.lazy
