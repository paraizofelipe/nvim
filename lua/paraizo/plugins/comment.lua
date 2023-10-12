M = {}

local function load_config()
	local comment = require("Comment")

	local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

	comment.setup({
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		opleader = {
			line = "gc",
			block = "gb",
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		},
		mappings = {
			basic = true,
			extra = true,
		},
		pre_hook = nil,
		post_hook = nil,
	})
end

M.lazy = {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = load_config,
}

return M.lazy
