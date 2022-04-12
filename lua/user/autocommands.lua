vim.cmd([[
    augroup _general_settings
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
        autocmd BufWinEnter * :set formatoptions-=cro
        autocmd FileType qf set nobuflisted
    augroup END

    augroup terminal_settings
        autocmd!
        autocmd FileType floaterm set number norelativenumber
        autocmd FileType floaterm set nonumber
        autocmd FileType floaterm set nocursorline
        autocmd FileType floaterm hi Floaterm guibg=#1d2021
    augroup END

    augroup long_lines
        autocmd!
        autocmd FileType qf wincmd J
        autocmd FileType help wincmd K
    augroup END
]])
