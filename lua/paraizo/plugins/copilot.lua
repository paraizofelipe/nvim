M = {}

local function load_config()
	local copilot = require("copilot")

	vim.cmd([[highlight CopilotSuggestion guifg=#827467 ctermfg=8]])

	copilot.setup({
		panel = {
			enabled = true,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<C-g>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]",
			},
		},
		filetypes = {
			yaml = true,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node",
		server_opts_overrides = {},
	})
end

M.lazy = {
	"zbirenbaum/copilot.lua",
	config = load_config,
	lazy = false,
	enabled = false,
}

return M.lazy
