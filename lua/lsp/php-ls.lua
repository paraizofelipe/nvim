local lspconfig = require'lspconfig'

lspconfig.intelephense.setup{
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = lspconfig.util.root_pattern("composer.json", ".git");
}
