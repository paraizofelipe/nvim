local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

    -- My plugins
    use 'paraizofelipe/translator.nvim'

    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'morhetz/gruvbox'

    -- Editor
    use 'mg979/vim-visual-multi'
    use 'mhinz/vim-startify'
    use 'justinmk/vim-sneak'
    use 'preservim/nerdcommenter'
    use 'rhysd/clever-f.vim'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-surround'
    -- QuickScope
    -- use 'unblevable/quick-scope'

    -- Markdown
    use 'iamcco/markdown-preview.nvim'

    -- Golang
    use 'fatih/vim-go'

    -- Tlescope
    use {'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        }
    }

    -- Keys
    use 'liuchengxu/vim-which-key'

    -- Color
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    -- Floatterm
    use 'voldikss/vim-floaterm'

    -- VimWiki
    use 'vimwiki/vimwiki'

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

    -- Treesitter
    -- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use 'p00f/nvim-ts-rainbow'
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    -- use 'nvim-treesitter/playground'
    -- use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- use 'windwp/nvim-ts-autotag'

    -- Git
    -- use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'samoshkin/vim-mergetool'

    -- Database
    use { 'tpope/vim-dadbod',
        requires = {
            'kristijanhusak/vim-dadbod-ui',
            'kristijanhusak/vim-dadbod-completion',
        }
    }

end)
