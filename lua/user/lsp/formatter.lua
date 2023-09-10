local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		go = {
			require("formatter.filetypes.go").gofmt,
			require("formatter.filetypes.go").goimports,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			-- require("formatter.filetypes.python").black,
			-- require("formatter.filetypes.python").isort,
			function()
				return {
					exe = "isort",
					ignore_exitcode = true,
					args = { "-q", "-" },
					stdin = false,
				}
			end,
			function()
				return {
					exe = "blue",
					ignore_exitcode = true,
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.cmd([[FormatWriteLock]])
	end,
})
