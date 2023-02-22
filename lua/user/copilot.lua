-- vim.g.copilot_filetypes = { xml = false }

-- vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]])
--[[ vim.g.copilot_no_tap_map = true ]]
--[[ vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')", { silent = true }) ]]

vim.cmd([[highlight CopilotSuggestion guifg=#5555555 ctermfg=8]])

require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
        },
        layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
})
