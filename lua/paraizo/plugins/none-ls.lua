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

		local h = require("null-ls.helpers")
		local methods = require("null-ls.methods")

		local FORMATTING = methods.internal.FORMATTING

		mason_null_ls.setup({
			ensure_installed = {
				"jq",
				"stylua",
				"blue",
				"yamlfmt",
				"ruff",
			},
		})

		local formatting = null_ls.builtins.formatting -- to setup formatters
		-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local blue_formatter = h.make_builtin({
			name = "blue",
			meta = {
				url = "https://github.com/grantjenks/blue",
				description = "Blue -- Some folks like black but I prefer blue.",
			},
			method = FORMATTING,
			filetypes = { "python" },
			generator_opts = {
				command = "blue",
				args = {
					-- "--verbose",
					"--stdin-filename",
					"$FILENAME",
					"--quiet",
					"-",
				},
				to_stdin = true,
			},
			factory = h.formatter_factory,
		})

		local ruff_formatter = h.make_builtin({
			name = "ruff",
			meta = {
				url = "https://github.com/astral-sh/ruff",
				description = "An extremely fast Python linter and code formatter, written in Rust.",
			},
			method = FORMATTING,
			filetypes = { "python" },
			generator_opts = {
				command = "ruff",
				args = {
					"format",
					"--quiet",
					"-",
				},
				to_stdin = true,
			},
			factory = h.formatter_factory,
		})

		local jq_formatter = h.make_builtin({
			name = "jq",
			meta = {
				url = "https://github.com/stedolan/jq",
				description = "Command-line JSON processor",
			},
			method = FORMATTING,
			filetypes = { "json" },
			generator_opts = { command = "jq", to_stdin = true },
			factory = h.formatter_factory,
		})

		-- configure null_ls
		null_ls.setup({
			-- debug = true,
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "pyproject.toml", "go.mod"),
			sources = {
				formatting.stylua,
				formatting.isort,
				jq_formatter,
				-- ruff_formatter,
				-- blue_formatter,
				-- formatting.black,
				formatting.yamlfmt,
				formatting.gofmt,
				formatting.goimports,
				formatting.clang_format.with({
					extra_args = { "-style={BasedOnStyle: Google, IndentWidth: 4}" },
				}),
			},
			on_attach = function(current_client, bufnr)
				if current_client.server_capabilities.documentFormattingProvider then
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
