require("persistence").setup({
	dir = vim.fn.expand(vim.fn.stdpath("config") .. "/persistence_session/"),
	options = { "buffers", "curdir", "tabpages", "winsize" },
})
