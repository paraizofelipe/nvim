M = {}

M.lazy = {
	"mg979/vim-visual-multi",
	lazy = true,
	keys = {
		{ "<C-n>", mode = "n" },
		{ "<C-Up>", mode = "n" },
		{ "<C-Down>", mode = "n" },
		{ "<C-n>", mode = "v" },
	},
}

return M.lazy
