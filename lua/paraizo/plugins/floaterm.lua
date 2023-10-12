M = {}

local function load_config()
	vim.g.floaterm_gitcommit = "floaterm"
	-- vim.g.floaterm_autoinsert = 1
	vim.g.floaterm_width = 0.4
	vim.g.floaterm_height = 0.3
	vim.g.floaterm_wintitle = 0
	vim.g.floaterm_autoclose = 1
	vim.g.floaterm_wintype = "split"

	local terminal_settings = vim.api.nvim_create_augroup("TerminalSttings", { clear = true })
	vim.api.nvim_create_autocmd("TermOpen", {
		group = terminal_settings,
		callback = function()
			vim.api.nvim_win_set_option(0, "relativenumber", false)
			vim.api.nvim_win_set_option(0, "number", false)
			vim.api.nvim_win_set_option(0, "cursorline", false)
		end,
	})
end

M.lazy = {
	"voldikss/vim-floaterm",
	event = "VimEnter",
	config = load_config,
	lazy = true,
}

return M.lazy
