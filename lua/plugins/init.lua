local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

local my = function(file)
    require(file)
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- My plugins
    use 'paraizofelipe/translator.nvim'
    use '~/projects/good-night.nvim'
    use '~/projects/orgpp.nvim'
    use '~/projects/telescope_session'
    -- use 'nvim-telescope/telescope.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('plugins.telescope').setup()
            require('telescope').load_extension('telescope_session')
        end
    }

    -- Theme
    use 'morhetz/gruvbox'

    -- Editor
    use 'mg979/vim-visual-multi'
    use 'preservim/nerdcommenter'
    use 'rhysd/clever-f.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    -- use 'tpope/vim-vinegar'
    -- use 'tpope/vim-surround'
    -- use 'vim-ctrlspace/vim-ctrlspace'

    -- Startup
    use 'mhinz/vim-startify'
    -- use {
    -- 'glepnir/dashboard-nvim',
    -- config = function()
    -- require('plugins.dashboard').setup()
    -- end
    -- }

    -- Session
    -- use {
    -- 'rmagatti/auto-session',
    -- config = function()
    -- require('plugins.session').setup()
    -- end
    -- }
    -- use {
    -- 'rmagatti/session-lens',
    -- config = function()
    -- require('plugins.lens').setup()
    -- end
    -- }

    -- Debugging
    use {'puremourning/vimspector'}

    -- QuickScope
    -- use 'unblevable/quick-scope'

    -- Markdown
    use 'iamcco/markdown-preview.nvim'

    -- Golang
    use 'fatih/vim-go'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
        config = function()
            require('plugins.telescope').setup()
        end
    }

    -- Keys
    -- use 'liuchengxu/vim-which-key'
    use 'folke/which-key.nvim'

    -- Color
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    -- Floatterm
    use 'voldikss/vim-floaterm'

    -- Notes and Todo
    use 'vimwiki/vimwiki'
    -- use 'tools-life/taskwiki'
    -- use 'kristijanhusak/orgmode.nvim'
    -- use 'vhyrro/neorg'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status line
    use 'glepnir/galaxyline.nvim'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'

    -- Tabline
    use 'jose-elias-alvarez/buftabline.nvim'
    -- use {
    -- 'romgrk/barbar.nvim',
    -- config = function()
    -- require('plugins.barbar')
    -- end
    -- }
    -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'samoshkin/vim-mergetool'

    -- Database
    use {
        'tpope/vim-dadbod',
        requires = {
            'kristijanhusak/vim-dadbod-ui',
            'kristijanhusak/vim-dadbod-completion'
        }
    }

end)
