M = {}

local function load_config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("s", "   Load last session", ":lua require('persistence').load({ last = true })<CR>"),
		dashboard.button("f", "   Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "   Find project", ":Telescope projects <CR>"),
		dashboard.button("r", "   Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "   Find text", ":Telescope live_grep <CR>"),
		dashboard.button(
			"t",
			"   Show containers",
			":FloatermNew --wintype=float --width=0.8 --height=0.8 lazydocker <CR>"
		),
		dashboard.button("c", "   Configuration", ":e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("q", "   Quit Neovim", ":qa<CR>"),
	}

	local v = vim.version()
	local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch
	local author = " : Felipe Paraizo"
	local url = " : http://paraizo.dev"

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			dashboard.section.footer.val = {
				"",
				"",
				author,
				url,
				"",
				"⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms",
				"",
				version,
			}
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	dashboard.section.footer.opts.hl = "Operator"
	dashboard.section.header.opts.hl = "Type"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.config.layout[1] = { type = "padding", val = 20 }
	dashboard.config.layout[3] = { type = "padding", val = 4 }

	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

M.lazy = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = load_config,
	lazy = true,
}

return M.lazy
