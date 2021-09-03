local lspconfig = require 'lspconfig'

lspconfig.pyright.setup {
    cmd = {"pylsp"},
    filetypes = {"python"},
    root_dir = function(fname)
        local root_files = {'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile'}
        return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
    end,
    settings = {python = {analysis = {autoSearchPaths = true, diagnosticMode = "workspace", useLibraryCodeForTypes = true}}}
}
