local lspconfig = require'lspconfig'

lspconfig.gopls.setup{
    -- cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
    cmd = {"gopls"},
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern('.git', 'go.mod');
}

function GoToDef() 
    vim.lsp.buf.definition()
end

function GoToDoc()
    vim.cmd('Lspsaga code_hover_doc')
end

vim.cmd('command! GoToDef lua GoToDef()')
