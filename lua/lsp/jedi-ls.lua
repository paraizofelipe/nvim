local lspconfig = require 'lspconfig'

lspconfig.jedi_language_server.setup {
    cmd = {"jedi-language-server"},
    filetypes = {"python"},
    root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")
}
