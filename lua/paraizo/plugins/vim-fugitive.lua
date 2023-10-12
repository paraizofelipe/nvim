return {
	"tpope/vim-fugitive",
	lazy = true,
	config = function()
		vim.cmd("set diffopt+=iwhite")
	end,
	cmd = { "Git" },
}
