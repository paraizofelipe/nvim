local status_ok, configs, parser_configs = pcall(function()
	local configs = require("nvim-treesitter.configs")
	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
	return configs, parser_configs
end)
if not status_ok then
	return
end
parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}

parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}

parser_configs.hurl = {
	install_info = {
		url = "https://github.com/pfeiferj/tree-sitter-hurl",
		files = { "src/parser.c" },
		branch = "main",
	},
}

configs.setup({
	ensure_installed = { "norg", "norg_meta", "norg_table", "javascript", "yaml", "markdown", "python", "go", "lua" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
