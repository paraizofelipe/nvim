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
				args = { "-s", "--log-level", "DEBUG" },
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

	--
	vim.api.nvim_set_hl(0, "TestFail", { fg = "#fe8019", bg = "#3c3836" })
	-- vim.api.nvim_set_hl(0, "TestFail", { fg = "#d3869b", bg = "#3c3836" })

	vim.fn.sign_define("neotest_running", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_skipped", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_passed", { text = "", texthl = "CocHintSign", linehl = "", numhl = "" })
	vim.fn.sign_define("neotest_failed", { text = "", texthl = "TestFail", linehl = "", numhl = "" })
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
