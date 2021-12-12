require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "python", "yaml"},
    logFile = "~/output.log",
    logLevel = 1,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --break-after-table-lb",
                    formatStdin = true
                }
            },
            python = {
                {
                    formatCommand = 'black -t py38 --line-length 79 --quiet -',
                    formatStdin = true
                }, {
                    formatCommand = 'isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=88 -l 79 -s venv --quiet -',
                    formatStdin = true
                }
            },
            yaml = {{lintCommand = 'yamllint -f parsable -', lintStdin = true}}
        }
    }
}

vim.cmd('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()')
vim.cmd('autocmd BufWritePre *.yml lua vim.lsp.buf.formatting_sync()')
vim.cmd('autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync()')

vim.cmd('autocmd FileType python set cc=79')
