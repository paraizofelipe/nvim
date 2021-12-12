vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'q', ':quit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q', 'q', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-e>', '4<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-y>', '4<c-y>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader>1', ':exec 1 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>2', ':exec 2 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>3', ':exec 3 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>4', ':exec 4 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>5', ':exec 5 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>6', ':exec 6 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>7', ':exec 7 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>8', ':exec 8 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>9', ':exec 9 . "wincmd w"<CR>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>AirlineSelectTab1',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>AirlineSelectTab2',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>AirlineSelectTab3',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>AirlineSelectTab4',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>AirlineSelectTab5',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>AirlineSelectTab6',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>AirlineSelectTab7',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>AirlineSelectTab8',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>AirlineSelectTab9',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader><Left>', '<Plug>AirlineSelectPrevTab',
-- {noremap = false})
-- vim.api.nvim_set_keymap('n', '<leader><Right>', '<Plug>AirlineSelectNextTab',
-- {noremap = false})

-- vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>',
-- {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>',
-- {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>0', '<Cmd>BufferLast<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><Left>', '<Cmd>BufferPrevious<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><Right>', '<Cmd>BufferNext<CR>',
                        {noremap = true})

local whichkey = {
    {
        keys = {
            s = {
                name = "+search",
                ["."] = {"<cmd>Telescope filetypes<cr>", "ffiletypes"},
                B = {"<cmd>Telescope git_branches<cr>", "fgit branches"},
                d = {
                    "<cmd>Telescope lsp_document_diagnostics<cr>",
                    "fdocument_diagnostics"
                },
                D = {
                    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                    "fworkspace_diagnostics"
                },
                f = {"<cmd>Telescope find_files<cr>", "ffiles"},
                h = {"<cmd>Telescope command_history<cr>", "fhistory"},
                i = {"<cmd>Telescope media_files<cr>", "fmedia files"},
                m = {"<cmd>Telescope marks<cr>", "fmarks"},
                M = {"<cmd>Telescope man_pages<cr>", "fman_pages"},
                o = {"<cmd>Telescope vim_options<cr>", "fvim_options"},
                t = {"<cmd>Telescope live_grep<cr>", "ftext"},
                r = {"<cmd>Telescope registers<cr>", "fregisters"},
                w = {"<cmd>Telescope file_browser<cr>", "fbuf_fuz_find"},
                u = {"<cmd>Telescope colorscheme<cr>", "fcolorschemes"}
            },

            f = {
                name = "+files",
                t = {"<cmd>Explore<cr>", "Open netrw"},
                r = {"<cmd>FloatermNew ranger<cr>", "Open Ranger"}
            },

            b = {
                name = "+buffers",
                d = {"<cmd>BFdelete<cr>", "Delete buffers"},
                c = {"<cmd>bwipeout<cr>", "Close buffers"},
                l = {"<cmd>ls<cr>", "List buffers"},
                n = {"<cmd>bnext<cr>", "Next buffer"},
                p = {"<cmd>bprevious<cr>", "Previous buffer"}
            },

            t = {
                name = "+tabs",
                c = {"<cmd>tabclose<cr>", "Close tabs"},
                l = {"<cmd>tabs<cr>", "List tabs"}
            },

            ["/"] = {"<plug>NERDCommenterInvert", "Comment line"},

            a = {
                name = "+applications",
                f = {"<cmd>FloatermNew fzf<cr>", "FZF"},
                g = {"<cmd>FloatermNew lazygit<cr>", "Git"},
                d = {"<cmd>FloatermNew lazydocker<cr>", "Docker"},
                n = {"<cmd>FloatermNew node<cr>", "Node"},
                p = {"<cmd>FloatermNew python<cr>", "Python"},
                t = {
                    "<cmd>FloatermNew --name=terminal --wintype=split --position=botright --height=20 zsh<cr>",
                    "Terminal split"
                }
            },

            n = {
                name = "+nvim",
                k = {
                    "<cmd>e ~/.config/nvim/vimscript/whichkey/init.vim<cr>",
                    "Edit keys config"
                },
                i = {"<cmd>e ~/.config/nvim/init.lua<cr>", "edit init config"},
                p = {
                    "<cmd>e ~/.config/nvim/lua/plugins/init.lua<cr>",
                    "Edit plug config"
                },
                g = {
                    "<cmd>e ~/.config/nvim/lua/settings.lua<cr>",
                    "Edit general settings"
                },
                G = {
                    "<cmd>e ~/.config/nvim/lua/global-settings.lua<cr>",
                    "Edit global settings"
                }
            },

            d = {
                name = "+diff",
                t = {"<cmd>diffthis<cr>", "Active diff this file"},
                o = {"<cmd>diffoff<cr>", "Disable diff in file"},
                s = {"<cmd>diffsplit<cr>", "Open diff in split mode"},
                g = {"<cmd>Gdiffsplit<cr>", "Open git diff in current file"}
            },

            o = {
                name = "+org",
                c = {"<cmd>OrgCheckBox<cr>", "Toggle checkbox"},
                d = {"<cmd>OrgToggleDone<cr>", "Toggle task status"}
            },

            ss = {
                name = "+session",
                -- s = {"<cmd>SessionSave<cr>", "Save session"},
                -- l = {"<cmd>SessionLoad<cr>", "Load session"}
                s = {"<cmd>SSave<cr>", "Save session"},
                c = {"<cmd>SClose<cr>", "Close session"},
                l = {"<cmd>SLoad<cr>", "Load session"},
                t = {
                    "<cmd>Telescope telescope_session<cr>",
                    "Load session with telescope"
                }
            },

            l = {
                name = "+LSP",
                a = {"<cmd>Lspsaga code_action<cr>", "Code actions"},
                s = {"<cmd>LspStart<cr>", "Start LSP"},
                S = {"<cmd>LspStop<cr>", "Stop LSP"},
                i = {"<cmd>LspInfo<cr>", "LSP Info"},
                d = {"<cmd>Lspsaga hover_doc<cr>", "Item documentation"},
                r = {"<cmd>Lspsaga rename<cr>", "Refactor code element"},
                g = {
                    name = "+goto",
                    d = {
                        "<cmd>lua vim.lsp.buf.definition()<cr>",
                        "Goto definition"
                    },
                    r = {
                        "<cmd>lua vim.lsp.buf.references()<cr>",
                        "Goto references"
                    },
                    i = {
                        "<cmd>lua vim.lsp.buf.implementation()<cr>",
                        "Goto implementation"
                    },
                    D = {
                        "<cmd>Lspsaga diagnostic_jump_next<cr>",
                        "Goto next diagnostic"
                    }
                }
            }
        },
        options = {mode = "n", prefix = "<leader>"}
    }, {
        keys = {["/"] = {"<plug>NERDCommenterInvert", "Comment line"}},
        options = {mode = "v", prefix = "<leader>"}
    }
}

return whichkey
