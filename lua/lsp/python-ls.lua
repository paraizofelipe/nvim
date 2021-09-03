local lspconfig = require 'lspconfig'

lspconfig.pyright.setup {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
    settings = {python = {analysis = {autoSearchPaths = true, diagnosticMode = "openFilesOnly", useLibraryCodeForTypes = true}}}
}
