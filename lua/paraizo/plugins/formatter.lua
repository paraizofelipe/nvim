M = {}

local function load_config()
	local formatter = require("formatter")

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
				require("formatter.filetypes.python").isort,
				-- require("formatter.filetypes.python").black,
				-- function()
				--     return {
				--         exe = "isort",
				--         ignore_exitcode = true,
				--         args = { "-q", "-" },
				--         stdin = false,
				--     }
				-- end,
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
end

M.lazy = {
	"mhartington/formatter.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = load_config,
}

return M.lazy
