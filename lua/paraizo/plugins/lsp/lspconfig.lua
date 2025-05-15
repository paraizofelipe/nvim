local M = {}

local lua_ls_opts = require("paraizo.plugins.lsp.settings.lua_ls")
local pyright_opts = require("paraizo.plugins.lsp.settings.pyright")
local pylsp_opts = require("paraizo.plugins.lsp.settings.pylsp")
local ruff_opts = require("paraizo.plugins.lsp.settings.ruff")
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
		-- keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		keymap.set("n", "gr", vim.lsp.buf.references, opts)

		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	end

	-- vim.lsp.set_log_level("debug")

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

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	})

	-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	-- for type, icon in pairs(signs) do
	-- 	local hl = "DiagnosticSign" .. type
	-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	-- end

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

	lspconfig.ruff.setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		-- init_options = ruff_opts,
		init_options = {
			settings = {
				configuration = "/home/paraizo/.config/ruff.toml",
				-- logLevel = "debug",
				configurationPreference = "filesystemFirst",
			},
		},
	})

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = lua_ls_opts,
	})

	-- lspconfig.pylsp.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	settings = pylsp_opts,
	-- })

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

	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"/home/paraizo/projects/esp-clang/bin/clangd",
			"--background-index",
			"--offset-encoding=utf-16",
			"--query-driver=/home/paraizo/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-*",
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	})

	-- lspconfig.ccls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	cmd = {
	-- 		"ccls",
	-- 	},
	-- 	filetypes = {
	-- 		"c",
	-- 		"cpp",
	-- 		"h",
	-- 		"hpp",
	-- 	},
	-- })
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
