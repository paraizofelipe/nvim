M = {}

local function load_config()
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetype_overrides = {},
		filetypes_denylist = {
			"dirvish",
			"fugitive",
			"alpha",
			"NvimTree",
			"lazy",
			"neogitstatus",
			"Trouble",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
		},
		filetypes_allowlist = {},
		modes_denylist = {},
		modes_allowlist = {},
		providers_regex_syntax_denylist = {},
		providers_regex_syntax_allowlist = {},
		under_cursor = true,
		large_file_cutoff = nil,
		large_file_overrides = nil,
		min_count_to_highlight = 1,
	})
end

M.lazy = {
	"RRethy/vim-illuminate",
	event = "BufReadPre",
	config = load_config,
	lazy = true,
}

return M.lazy
