local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end
-- linux
-- db.preview_command = "ueberzug"

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#d79921", bg = "bg" })
vim.api.nvim_set_hl(0, "DashboardCenterIcon", { fg = "#458588", bg = "bg" })
vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#b16286", bg = "bg" })

db.preview_file_path = home
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_header = {
	"                                                      ",
	"    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                                      ",
	"                                                      ",
	"                 Author: Felipe Paraizo               ",
	"                 URL: http://paraizo.dev              ",
	"                                                      ",
	"                                                      ",
}

db.header_pad = 20
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session                 ",
		shortcut = "SPC s s",
		action = "Telescope possession list",
	},
	{
		icon = "  ",
		desc = "Find Project                            ",
		shortcut = "SPC P  ",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC s f",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC s t",
	},
	{
		icon = "  ",
		desc = "Show containers                         ",
		action = "FloatermNew --wintype=float --width=0.8 --height=0.8 lazydocker",
		shortcut = "SPC a d",
	},
	{
		icon = "  ",
		desc = "Settings                                ",
		action = "PossessionLoad nvim",
		shortcut = "SPC z  ",
	},
}
