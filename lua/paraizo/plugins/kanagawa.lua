M = {}

local function load_config()
	local kanagawaa = require("kanagawa")

	kanagawaa.setup({
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		colors = {
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(colors)
			return {}
		end,
		theme = "wave",
		background = {
			dark = "wave",
			light = "lotus",
		},
	})

	vim.cmd("colorscheme kanagawa-wave")
end

M.lazy = {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = load_config,
	priority = 1000,
	lazy = false,
}

return M.lazy
