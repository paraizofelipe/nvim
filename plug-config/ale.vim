let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'i'
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" highlight ALEErrorSign ctermbg=239 ctermfg=red
" highlight ALEWarningSign ctermbg=238 ctermfg=yellow

highlight ALEWarning guibg=221
highlight ALEError guibg=203

let g:ale_python_pylint_executable = 'pipenv'
let g:ale_python_flake8_executable = 'pipenv'
" let g:ale_python_pylint_use_global = 1
" let g:ale_python_flake8_use_global = 1
let g:ale_python_black_use_global = 1
let g:ale_python_isort_use_global = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'go': ['golint', 'go vet', 'gofmt'],
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort']
\}
