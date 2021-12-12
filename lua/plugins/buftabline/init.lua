require("buftabline").setup {
    tab_format = "▋ #{i} #{n} #{b}#{f} ",
    buffer_id_index = false,
    icon_colors = false,
    start_hidden = false,
    auto_hide = false,
    disable_commands = false,
    go_to_maps = true,
    flags = {modified = " ", not_modifiable = "[-]", readonly = ""},
    hlgroups = {
        current = "Conceal",
        normal = "BufTabLineHidden",
        active = "BufTabLineActive",
        spacing = nil,
        modified_current = "PreProc",
        modified_normal = nil,
        modified_active = nil,
        tabpage_current = nil,
        tabpage_normal = nil
    },
    show_tabpages = true,
    tabpage_format = " #{n} ",
    tabpage_position = "right"
}
