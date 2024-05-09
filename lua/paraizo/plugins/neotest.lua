M = {}

local function load_config()
	local neotest = require("neotest")
	local neotest_python = require("neotest-python")
	local neotest_go = require("neotest-go")

	neotest.setup({
		quickfix = {
			enabled = false,
			open = false,
		},
		adapters = {
			neotest_python({
				dap = { justMyCode = false },
				args = { "--log-level", "DEBUG" },
				runner = "pytest",
				-- python = "/home/paraizo/.pyenv/versions/nvim/bin/python",
			}),
			neotest_go({
				experimental = {
					test_table = true,
				},
				args = { "-count=1", "-timeout=60s" },
			}),
		},
	})

	vim.fn.sign_define("neotest_running", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_skipped", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_passed", { text = "", texthl = "CocHintSign", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_failed", { text = "", texthl = "CocErrorSign", linehl = "", numhl = "" })
end

M.lazy = {
	"nvim-neotest/neotest",
	config = load_config,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
	},
	lazy = true,
}

return M.lazy
