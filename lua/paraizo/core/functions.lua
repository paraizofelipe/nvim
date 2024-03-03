local M = {}

local langs = {
	python = {
		struct = "class",
	},
	go = {
		struct = "struct",
	},
}

M.showSymbolByLang = function(lang, symbols)
	local symbolList = {}
	for _, symbol in ipairs(symbols) do
		if langs[lang] and langs[lang][symbol] then
			table.insert(symbolList, langs[lang][symbol])
		else
			table.insert(symbolList, symbol)
		end
	end

	local opts = {
		symbols = symbolList,
	}
	require("telescope.builtin").lsp_document_symbols(opts)
end

M.showSymbol = function(symbols)
	M.showSymbolByLang(vim.bo.filetype, symbols)
end

vim.api.nvim_create_user_command("ShowSymbol", function(opts)
	local symbols = vim.split(opts.args, " ")
	M.showSymbol(symbols)
end, { nargs = "+", desc = "Filter symbols with Telescope" })

vim.api.nvim_create_user_command("ShowWorkspaceSymbol", function(opts)
	local symbols = vim.split(opts.args, " ")
	vim.ui.input({ prompt = "Query: " }, function(input)
		if input then
			local param = {
				query = input,
				symbols = symbols,
			}
			require("telescope.builtin").lsp_workspace_symbols(param)
		end
	end)
end, { nargs = "+", desc = "Filter symbols in workspace with Telescope" })

return M
