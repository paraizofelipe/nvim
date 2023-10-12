local M = {}

local lua_ls_opts = require("paraizo.plugins.lsp.settings.lua_ls")
local pyright_opts = require("paraizo.plugins.lsp.settings.pyright")
local jsonls_opts = require("paraizo.plugins.lsp.settings.jsonls")

local function load_config()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local keymap = vim.keymap

	local opts = { noremap = true, silent = true }
	local on_attach = function(client, bufnr)
		opts.buffer = bufnr

		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "K", vim.lsp.buf.hover, opts)
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		keymap.set("n", "gr", vim.lsp.buf.references, opts)

		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig.yamlls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig.docker_compose_language_service.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig.ruff_lsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		config = "~/.config/.ruff.toml",
	})

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = lua_ls_opts,
	})

	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = pyright_opts,
	})

	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = jsonls_opts.settings,
		setup = jsonls_opts.setup,
	})
end

M.lazy = {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = load_config,
		lazy = true,
	},
}

return M.lazy
