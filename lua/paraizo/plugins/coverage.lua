M = {}

local function load_config()
	local coverage = require("coverage")

	coverage.setup({
		commands = true,
		highlights = {
			covered = { bg = "#b8bb26" },
			uncovered = { bg = "#fb4934" },
			summary_pass = { link = "GruvboxGreenSign" },
			summary_fail = { link = "GruvboxRedSign" },
		},
		signs = {
			covered = { hl = "CoverageCovered", text = " " },
			uncovered = { hl = "CoverageUncovered", text = " " },
		},
		summary = {
			min_coverage = 90.0,
		},
	})
end

M.lazy = {
	"andythigpen/nvim-coverage",
	version = "*",
	config = load_config,
	lazy = true,
	cmd = "Coverage",
}

return M.lazy
