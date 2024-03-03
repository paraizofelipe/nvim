return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"jq",
				"stylua",
				"blue",
				"yamlfmt",
			},
		})

		local formatting = null_ls.builtins.formatting -- to setup formatters
		-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			debug = true,
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "pyproject.toml", "go.mod"),
			sources = {
				formatting.stylua,
				formatting.isort,
				formatting.blue,
				formatting.jq,
				formatting.yamlfmt,
				formatting.gofmt,
				formatting.goimports,
				-- formatting.clang_format.with({
				-- 	extra_args = { "-style={BasedOnStyle: Google, IndentWidth: 4}" },
				-- }),
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
