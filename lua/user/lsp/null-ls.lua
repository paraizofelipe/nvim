local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

--[[ local function get_venv_bin_path() ]]
--[[ 	local virtual_env_path = "" ]]
--[[ 	local virtual_env_dirctory = "" ]]
--[[ 	local Job = require("plenary.job") ]]
--[[ 	local Path = require("plenary.path") ]]
--[[]]
--[[ 	local j1 = Job:new({ ]]
--[[ 		command = "poetry", ]]
--[[ 		args = { "config", "virtualenvs.path" }, ]]
--[[ 		on_stdout = function(_, data) ]]
--[[ 			virtual_env_path = vim.trim(data) ]]
--[[ 		end, ]]
--[[ 	}) ]]
--[[]]
--[[ 	local j2 = Job:new({ ]]
--[[ 		command = "poetry", ]]
--[[ 		args = { "env", "list" }, ]]
--[[ 		on_stdout = function(_, data) ]]
--[[ 			virtual_env_dirctory = string.gsub(vim.trim(data), " %(Activated%)", "") ]]
--[[ 		end, ]]
--[[ 	}) ]]
--[[]]
--[[ 	j1:start() ]]
--[[ 	j2:start() ]]
--[[]]
--[[ 	j1:wait() ]]
--[[ 	j2:wait() ]]
--[[]]
--[[ 	local env_dir = string.format("%s/%s/bin/", virtual_env_path, virtual_env_dirctory) ]]
--[[ 	if not Path:new(env_dir):is_dir() then ]]
--[[ 		return "" ]]
--[[ 	end ]]
--[[]]
--[[ 	return env_dir ]]
--[[ end ]]
--[[]]
--[[ local virtual_env_bin_path = "" ]]
--[[]]
--[[ local function virtual_env_cmd() ]]
--[[ 	if virtual_env_bin_path == "" then ]]
--[[ 		virtual_env_bin_path = get_venv_bin_path() ]]
--[[ 	end ]]
--[[ 	return virtual_env_bin_path ]]
--[[ end ]]

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.shellcheck,
		formatting.gofmt,
		formatting.goimports,
		formatting.stylua,
		formatting.shfmt,
		formatting.isort.with({
			args = {
				"--multi-line",
				"3",
				"--trailing-comma",
				"--force-grid-wrap",
				"0",
				"--use-parentheses",
				"--line-width",
				"88",
				"-l",
				"79",
				"-s",
				"venv",
				"--quiet",
				"-",
			},
		}),
		formatting.black.with({
			args = {
				"-t",
				"py38",
				"--line-length=79",
				"--fast",
				"--quiet",
				"-",
			},
		}),
	},

	-- on_init = function()
	-- 	local virtual_env_path = virtual_env_cmd()
	--
	-- 	-- local blue_path = virtual_env_path .. "blue"
	-- 	local black_path = virtual_env_path .. "black"
	-- 	local flake8_path = virtual_env_path .. "flake8"
	-- 	local isort_path = virtual_env_path .. "isort"
	--
	-- 	null_ls.register({
	-- 		-- formatting.blue.with({ command = blue_path }),
	-- 		diagnostics.flake8.with({ command = flake8_path }),
	-- 		formatting.black.with({ command = black_path }),
	-- 		formatting.isort.with({ command = isort_path }),
	-- 	})
	-- end,

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) insteadvim
					-- vim.lsp.buf.format({ bufnr = bufnr })
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
