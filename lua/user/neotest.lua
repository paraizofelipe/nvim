require("neotest").setup({
	quickfix = {
		enabled = false,
		open = false,
	},
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = { "--log-level", "DEBUG" },
			runner = "pytest",
		}),
		require("neotest-go")({
			experimental = {
				test_table = true,
			},
			args = { "-count=1", "-timeout=60s" },
		}),
		-- require("neotest-plenary"),
		-- require("neotest-vim-test")({
		-- 	ignore_file_types = { "vim", "lua" },
		-- }),
	},
})

vim.fn.sign_define("neotest_running", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
vim.fn.sign_define("neotest_skipped", { text = "", texthl = "CursorLineNr", linehl = "", numhl = "" })
vim.fn.sign_define("neotest_passed", { text = "", texthl = "CocHintSign", linehl = "", numhl = "" })
vim.fn.sign_define("neotest_failed", { text = "", texthl = "CocErrorSign", linehl = "", numhl = "" })
