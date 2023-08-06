local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	highlight = true,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
	lsp = {
		auto_attach = true,
		preference = nil,
	},
})

local exclude = {
	"floaterm",
	"help",
	"startify",
	"dashboard",
	"lazy",
	"neo-tree",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
	"DressingSelect",
	"Jaq",
	"harpoon",
	"dap-repl",
	"dap-terminal",
	"dapui_console",
	"dapui_hover",
	"lab",
	"notify",
	"noice",
	"neotest-summary",
	"make",
	"",
}

function excludes()
	return vim.tbl_contains(exclude or {}, vim.bo.filetype)
end

function get_winbar()
	if excludes() then
		vim.o.winbar = nil
		return
	end
	vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

function create_winbar()
	vim.api.nvim_create_augroup("_winbar", {})
	if vim.fn.has("nvim-0.8") == 1 then
		vim.api.nvim_create_autocmd({
			"CursorHoldI",
			"CursorHold",
			"BufWinEnter",
			"BufFilePost",
			"InsertEnter",
			"BufWritePost",
			"TabClosed",
			"TabEnter",
		}, {
			group = "_winbar",
			callback = function()
				local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
				if not status_ok then
					get_winbar()
				end
			end,
		})
	end
end

create_winbar()
