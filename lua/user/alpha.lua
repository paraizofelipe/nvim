local if_nil = vim.F.if_nil
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl = "Conceal",
		hl_shortcut = "GruvboxPurpleBold",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		-- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
	button("s", "   Load last session", ":lua require('persistence').load({ last = true })<CR>"),
	button("f", "   Find file", ":Telescope find_files <CR>"),
	button("e", "   New file", ":ene <BAR> startinsert <CR>"),
	button("p", "   Find project", ":Telescope projects <CR>"),
	button("r", "   Recently used files", ":Telescope oldfiles <CR>"),
	button("t", "   Find text", ":Telescope live_grep <CR>"),
	button("t", "   Show containers", ":FloatermNew --wintype=float --width=0.8 --height=0.8 lazydocker <CR>"),
	button("c", "   Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	button("q", "   Quit Neovim", ":qa<CR>"),
}

local function footer()
	local author = "Author: Felipe Paraizo\nURL: http://paraizo.dev"
	return author
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Operator"
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.config.layout[1] = { type = "padding", val = 20 }
dashboard.config.layout[3] = { type = "padding", val = 4 }

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
