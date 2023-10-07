local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	on_config_done = nil,
	highlights = {
		warning_selected = {
			bold = true,
			italic = false,
		},
		warning_visible = {
			fg = "#ebdbb2",
			bg = "#282828",
			bold = true,
			italic = false,
		},
		error_selected = {
			bold = true,
			italic = false,
		},
		error_visible = {
			fg = "#ebdbb2",
			bg = "#282828",
			bold = true,
			italic = false,
		},
		separator = {
			fg = "#458588",
			-- bg = "#b16286",
		},
	},
	options = {
		active = true,
		keymap = {
			normal_mode = {},
		},
		mode = "buffers",
		numbers = "ordinal",
		close_command = function(bufnr)
			M.buf_kill("bd", bufnr, false)
		end,
		right_mouse_command = "vert sbuffer %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			style = "icon",
		},
		name_formatter = function(buf)
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		-- diagnostics = false,
		diagnostics_update_in_insert = false,
		diagnostics_indicator = diagnostics_indicator,
		custom_filter = custom_filter,
		offsets = {
			{
				filetype = "undotree",
				text = "Undotree",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "DiffviewFiles",
				text = "Diff View",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "flutterToolsOutline",
				text = "Flutter Outline",
				highlight = "PanelHeading",
			},
			{
				filetype = "lazy",
				text = "Lazy",
				highlight = "PanelHeading",
				padding = 1,
			},
		},
		color_icons = true,
		show_close_icon = false,
		show_buffer_close_icons = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = false,
		hover = {
			enabled = false,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "id",
	},
})
