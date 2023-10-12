local M = {}

local options = {
	hint = "statusline-winbar",
	selection_chars = "FJDKSLA;CMRUEIWOQP",
	picker_config = {
		statusline_winbar_picker = {
			selection_display = function(char, windowid)
				return "%=" .. char .. "%="
			end,
			use_winbar = "never", -- "always" | "never" | "smart"
		},

		floating_big_letter = {
			font = "ansi-shadow", -- ansi-shadow |
		},
	},
	show_prompt = true,
	prompt_message = "Pick window: ",
	filter_func = nil,
	filter_rules = {
		autoselect_one = true,
		include_current_win = false,
		bo = {
			filetype = { "NvimTree", "neo-tree", "notify" },
			buftype = { "terminal" },
		},
		wo = {},
		file_path_contains = {},
		file_name_contains = {},
	},
	highlights = {
		statusline = {
			focused = {
				fg = "#ededed",
				bg = "#e35e4f",
				bold = true,
			},
			unfocused = {
				fg = "#ededed",
				bg = "#44cc41",
				bold = true,
			},
		},
		winbar = {
			focused = {
				fg = "#ededed",
				bg = "#e35e4f",
				bold = true,
			},
			unfocused = {
				fg = "#ededed",
				bg = "#44cc41",
				bold = true,
			},
		},
	},
}

local function load_config()
	require("window-picker").setup(options)
end

M.lazy = {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",
	version = "2.*",
	opts = options,
	config = load_config,
	lazy = true,
}

return M.lazy
