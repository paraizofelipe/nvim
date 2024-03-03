M = {}

local function load_config()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		ensure_installed = {
			"yaml",
			"markdown",
			"python",
			"go",
			"lua",
			"json",
			"bash",
			"vim",
			"dockerfile",
			"gitignore",
		},
		autotag = {
			enable = true,
		},
		sync_install = false,
		ignore_install = { "" }, -- List of parsers to ignore installing
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = true,
		},
		indent = { enable = true, disable = { "yaml" } },
		-- context_commentstring = {
		-- 	enable = true,
		-- 	enable_autocmd = false,
		-- },
	})
end

M.lazy = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = load_config,
	lazy = true,
}

return M.lazy
