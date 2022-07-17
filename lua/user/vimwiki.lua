vim.g.vimwiki_list = {
	{
		name = "notes",
		path = "~/notes/",
		path_html = "~/notes/html/",
		syntax = "markdown",
		ext = ".md",
		custom_wiki2html = "vimwiki_markdown",
		automatic_nested_syntaxes = 1,
		nested_syntaxes = { python = "python", go = "go", json = "json", yaml = "yaml", bash = "bash" },
		auto_tags = 1,
		vimwiki_folding = "list",
		css_name = "style.css",
	},
}

vim.cmd([[
function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction
]])

vim.cmd([[
function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction
]])

vim.api.nvim_set_keymap("n", "<leader>wa", ":call VimwikiFindAllIncompleteTasks()<CR>", { expr = true })
vim.api.nvim_set_keymap("n", "<leader>wx", ":call VimwikiFindIncompleteTasks()<CR>", { expr = true })
