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
-- require('plugins.galaxyline')
require('plugins.airline')

-- VimScripts
vim.cmd('source ~/.config/nvim/vimscript/whichkey/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions/init.vim')

-- LSP
require('lsp')
require('lsp.go-ls')
require('lsp.php-ls')
require('lsp.lua-ls')

--- Teste 123
