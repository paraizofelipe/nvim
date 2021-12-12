local M = {}

M.config = function()
    vim.g.dashboard_default_executive = 'telescope'

    -- nmap <Leader>ss :<C-u>SessionSave<CR>
    -- nmap <Leader>sl :<C-u>SessionLoad<CR>

    vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()',
                            {expr = true, noremap = true})
    -- nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
    -- nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
    -- nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
    -- nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
    -- nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
    -- nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
end

M.setup = function()
    M.config()
end

return M
