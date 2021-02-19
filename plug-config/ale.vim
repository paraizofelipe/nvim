let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 0

" highlight ALEErrorSign ctermbg=239 ctermfg=red
" highlight ALEWarningSign ctermbg=238 ctermfg=yellow
" highlight ALEInfoSign ctermbg=238 ctermfg=blue

highlight ALEWarning guibg=221
highlight ALEError guibg=203

" UI 
" let g:ale_completion_enabled = 1
" let g:ale_floating_preview = 1
" let g:ale_detail_to_floating_preview = 1
" let g:ale_hover_to_floating_preview = 1

" Python 
let g:ale_python_pylint_executable = 'pipenv'
let g:ale_python_flake8_executable = 'pipenv'
" let g:ale_python_pylint_use_global = 1
" let g:ale_python_flake8_use_global = 1
let g:ale_python_black_use_global = 1
let g:ale_python_isort_use_global = 1
let g:ale_fix_on_save = 1

" Linters and Fixers
let g:ale_linters = {
\   'go': ['golint', 'go vet', 'gofmt'],
\   'python': ['pyright', 'pylint'],
\   'json': ['jsonlint'],
\   'yaml': ['yamllint'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\}
