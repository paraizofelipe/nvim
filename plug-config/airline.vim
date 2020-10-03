let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#ale#enabled = 1


" Show number of window
function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', ' %{tabpagewinnr(tabpagenr())} ')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')
