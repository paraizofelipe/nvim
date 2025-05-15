M = {}

local function load_config()
	local auto_session = require("auto-session")

	auto_session.setup({
		auto_restore_enabled = false,
		auto_session_enable_last_session = false,
		auto_session_suppress_dirs = { "~/", "~/paraizo", "~/Downloads", "~/Documents", "~/Desktop/" },
	})

	local keymap = vim.keymap

	keymap.set("n", "<leader>qr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
	keymap.set("n", "<leader>qs", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
end

M.lazy = {
	"rmagatti/auto-session",
	config = load_config,
	cmd = { "SessionSave", "SessionRestore" },
	lazy = true,
}

return M.lazy
