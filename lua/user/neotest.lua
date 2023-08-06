local status_ok, neotest, neotest_python, neotest_go = pcall(function()
	neotest = require("neotest")
	neotest_python = require("neotest-python")
	neotest_go = require("neotest-go")
	return neotest, neotest_python, neotest_go
end)
if not status_ok then
	return
end

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
