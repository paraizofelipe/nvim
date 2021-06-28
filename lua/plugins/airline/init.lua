vim.g.airline_theme='gruvbox'
vim.g.airline_powerline_fonts = 1
-- vim.g.airline_left_sep = ''
-- vim.g.airline_left_alt_sep = ''
-- vim.g.airline_right_sep = ''
-- vim.g.airline_right_alt_sep = ''
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1
vim.g["airline#extensions#tabline#buffer_idx_format"] = {
    '0 ',
    '1 ',
    '2 ',
    '3 ',
    '4 ',
    '5 ',
    '6 ',
    '7 ',
    '8 ',
    '9 ',
}

vim.g["airline#extensions#disable_rtp_load"] = 1
vim.g["airline#extensions#nvimlsp#enabled"] = 1
vim.g["airline#extensions#nvimlsp#error_symbol"] = " :"
vim.g["airline#extensions#nvimlsp#warning_symbol"] = " :"

-- Show number of window
vim.api.nvim_exec([[
    function! WindowNumber(...)
        let builder = a:1
        let context = a:2
        call builder.add_section('airline_b', ' %{tabpagewinnr(tabpagenr())} ')
        return 0
    endfunction
]], false)

vim.fn["airline#add_statusline_func"]('WindowNumber')
vim.fn["airline#add_inactive_statusline_func"]('WindowNumber')
