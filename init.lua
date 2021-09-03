require('settings')
require('global-settings')
require('keys')
require('plugins')
require('colorscheme')

-- Load Plugins
require('plugins.colorizer')
require('plugins.compe')
require('plugins.gitsigns')
require('plugins.startify')
require('plugins.telescope')
require('plugins.dadbod')
require('plugins.nerdcommenter')
require('plugins.floaterm')
require('plugins.vim-go')
require('plugins.functions')
require('plugins.galaxyline')
require('plugins.buftabline')
-- require('plugins.orgmode')
require('plugins.indent-blankline')
require('plugins.treesitter')
-- require('plugins.neorg')
require('plugins.vimspector')
-- require('plugins.ctrlspace')
-- require('plugins.airline')

-- VimScripts
vim.cmd('source ~/.config/nvim/vimscript/whichkey/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions/init.vim')

-- LSP
require('lsp')
require('lsp.efm-ls')
require('lsp.go-ls')
require('lsp.python-ls')
-- require('lsp.jedi-ls')
-- require('lsp.pylsp-ls')
-- require('lsp.php-ls')
require('lsp.lua-ls')

--- Teste 123
