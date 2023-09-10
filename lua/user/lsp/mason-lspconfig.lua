local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.api.nvim_set_hl(0, "LspDiagnosticSignError", { fg = "Red", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "LspDiagnosticSignWarn", { fg = "Orange", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "LspDiagnosticSignHint", { fg = "LightGrey", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "LspDiagnosticSignInfo", { fg = "LightBlue", bg = "#3c3836" })

local function setupLspEditor()
	local signs = {
		{ name = "DiagnosticSignError", text = "", texthl = "LspDiagnosticSignError" },
		{ name = "DiagnosticSignWarn", text = "", texthl = "LspDiagnosticSignWarn" },
		{ name = "DiagnosticSignHint", text = "", texthl = "LspDiagnosticSignHint" },
		{ name = "DiagnosticSignInfo", text = "", texthl = "LspDiagnosticSignInfo" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.texthl, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
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

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		setupLspEditor()
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wl", function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	end,
})

local handlers = {
	-- LSP
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
	["gopls"] = function()
		lspconfig.gopls.setup({})
	end,
	["lua_ls"] = function()
		local lua_ls_opts = require("user.lsp.settings.lua_ls")
		lspconfig.lua_ls.setup({ lua_ls_opts })
	end,
	["pyright"] = function()
		local pyright_opts = require("user.lsp.settings.pyright")
		lspconfig.pyright.setup({ pyright_opts })
	end,
	["yamlls"] = function()
		lspconfig.yamlls.setup({})
	end,
	["jsonls"] = function()
		local jsonls_opts = require("user.lsp.settings.jsonls")
		lspconfig.jsonls.setup({ jsonls_opts })
	end,
	["bashls"] = function()
		lspconfig.bashls.setup({})
	end,
	["dockerls"] = function()
		lspconfig.dockerls.setup({})
	end,
	["docker_compose_language_service"] = function()
		lspconfig.docker_compose_language_service.setup({})
	end,
}

mason_lspconfig.setup({
	automatic_installation = true,
	handlers = handlers,
})
