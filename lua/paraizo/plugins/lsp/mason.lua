M = {}

local function load_config()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"gopls",
			"yamlls",
			"bashls",
			"dockerls",
			"docker_compose_language_service",
			"ruff_lsp",
			"lua_ls",
			"jsonls",
			"pyright",
			"vale_ls",
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"stylua", -- lua formatter
			"isort", -- python formatter
			"blue", -- python formatter
			"mypy", -- python linter
			"goimports", -- go formatter
			"vale",
			"hadolint",
			"jsonlint",
		},
	})
end

M.lazy = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = load_config,
}

return M.lazy
