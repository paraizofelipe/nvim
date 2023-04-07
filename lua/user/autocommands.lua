local terminal_settings = vim.api.nvim_create_augroup("TerminalSttings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	group = terminal_settings,
	callback = function()
		vim.api.nvim_win_set_option(0, "relativenumber", false)
		vim.api.nvim_win_set_option(0, "number", false)
		vim.api.nvim_win_set_option(0, "cursorline", false)
	end,
})
