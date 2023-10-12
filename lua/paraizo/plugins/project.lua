M = {}

local function load_config()
	local project = require("project_nvim")
	local telescope = require("telescope")

	project.setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { ".git", "go.mod", "package.json", "package.json", "pyproject.toml" },
		show_hidden = false,
		silent_chdir = true,
		ignore_lsp = {},
		datapath = vim.fn.stdpath("data"),
	})

	telescope.load_extension("projects")
end

M.lazy = {
	"ahmedkhalf/project.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-project.nvim",
	},
	config = load_config,
	lazy = false,
}

return M.lazy
