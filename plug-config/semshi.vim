let g:semshi#error_sign = v:false
let g:semshi#mark_selected_nodes = 1

" Custom highlighting
function! MyHighlights() abort
    " Define BadWhitespace before using in a match
    highlight BadWhitespace ctermbg=red guibg=darkred

    " Highlight spelling mistakes in red
    highlight SpellBad cterm=underline ctermfg=red guifg=red

    " Do not use separate background color in sign column
    " highlight SignColumn guibg=bg
    " highlight SignColumn ctermbg=bg

    " Use underlined, bold, green for current tag
    highlight TagbarHighlight guifg=#b8bb26
    highlight TagbarHighlight gui=bold,underline

    " Highlight search results in bold green
    highlight Search guibg=guibg guifg=#b8bb26 gui=bold,underline cterm=bold,underline

    " Try to use more subdued colors in vimdiff mode
    highlight DiffAdd cterm=bold ctermfg=142 ctermbg=235 gui=NONE guifg=#b8bb26 guibg=#3c3c25
    highlight DiffChange cterm=bold ctermfg=108 ctermbg=235 gui=NONE guifg=#8ec07c guibg=#383228
    highlight DiffText cterm=NONE ctermfg=214 ctermbg=235 gui=NONE guifg=#fabd2f guibg=#483D28
    highlight DiffDelete cterm=bold ctermfg=167 ctermbg=235 gui=NONE guifg=#fb4934 guibg=#372827

    " Use Gruvbox colors for python semshi semantic highlighter
    hi semshiGlobal          ctermfg=167 guifg=#fb4934
    hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
    hi semshiParameter       ctermfg=142  guifg=#98971a
    hi semshiParameterUnused ctermfg=106 guifg=#665c54
    hi semshiBuiltin         ctermfg=208 guifg=#fe8019
    hi semshiAttribute       ctermfg=108  guifg=fg
    hi semshiSelf            ctermfg=109 guifg=#85a598
    " hi semshiSelected        cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828
    hi! link   semshiSelected     MatchParen
endfunction


" autocmd BufNewFile,BufRead *.py call MyHighlights()
autocmd FileType python call MyHighlights()
