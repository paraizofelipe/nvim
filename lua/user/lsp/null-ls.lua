local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.gofmt,
		formatting.goimports,
		-- formatting.golines,
		formatting.stylua,
		formatting.isort,
		diagnostics.flake8,
		-- formatting.isort.with({
		-- 	args = {
		-- 		"--multi-line",
		-- 		"3",
		-- 		"--trailing-comma",
		-- 		"--force-grid-wrap",
		-- 		"0",
		-- 		"--use-parentheses",
		-- 		"--line-width",
		-- 		"88",
		-- 		"-l",
		-- 		"79",
		-- 		"-s",
		-- 		"venv",
		-- 		"--quiet",
		-- 		"-",
		-- 	},
		-- }),
		-- formatting.yapf,
		formatting.black.with({ args = { "-t", "py38", "--line-length", "79", "--quiet", "-" } }),
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- diagnostics.flake8.with({ extra_args = { "--max-line-length", "79" } }),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
