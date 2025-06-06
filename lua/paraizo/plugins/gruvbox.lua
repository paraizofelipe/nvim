local M = {}

M.bg = "#282828"
M.fg = "#fbf1c7"
M.day_brightness = 0.3

local function darkenColor(color, percentage)
	local bgColor = M.bg
	local r1, g1, b1 =
		tonumber(string.sub(bgColor, 2, 3), 16),
		tonumber(string.sub(bgColor, 4, 5), 16),
		tonumber(string.sub(bgColor, 6, 7), 16)
	local r2, g2, b2 =
		tonumber(string.sub(color, 2, 3), 16),
		tonumber(string.sub(color, 4, 5), 16),
		tonumber(string.sub(color, 6, 7), 16)

	local dr, dg, db = r2 - r1, g2 - g1, b2 - b1
	local newR, newG, newB = r2 - (dr * percentage / 100), g2 - (dg * percentage / 100), b2 - (db * percentage / 100)
	local hexColor = string.format("#%02x%02x%02x", newR, newG, newB)

	return hexColor
end

local function load_config()
	vim.api.nvim_set_option("termguicolors", true)
	vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "GruvboxBg0" })

	require("gruvbox").setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true,
		contrast = "",
		palette_overrides = {},
		overrides = {
			DiffChange = { bg = darkenColor("#5e8e5a", 87), fg = "", reverse = false },
			DiffAdd = { bg = darkenColor("#98971a", 87), fg = "", reverse = false },
			DiffDelete = { bg = darkenColor("#cc241d", 87), fg = "", reverse = false },
			DiffText = { bg = darkenColor("#d79921", 87), fg = "", reverse = false },
			-- LineNr = { fg = "#7c6f64", bg = "#3c3836" },
		},
		dim_inactive = false,
		transparent_mode = false,
	})

	vim.cmd("colorscheme gruvbox")
end

M.lazy = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	tag = "2.0.0",
	config = load_config,
}

return M.lazy
