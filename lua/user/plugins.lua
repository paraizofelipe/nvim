local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins
    --[[ use("paraizofelipe/translator.nvim") ]]
    --[[ use("~/projects/good-night.nvim") ]]
    --[[ use("~/projects/orgpp.nvim") ]]
    use({ "michaelb/sniprun", run = "bash ./install.sh" })

    -- General
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use("jose-elias-alvarez/buftabline.nvim")
    use("moll/vim-bbye")
    use("nvim-lualine/lualine.nvim")
    use("ahmedkhalf/project.nvim")
    use("lewis6991/impatient.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("goolord/alpha-nvim")
    --[[ use("antoinemadec/FixCursorHold.nvim") ]]
    use("folke/which-key.nvim")
    use("mg979/vim-visual-multi")
    use("samoshkin/vim-mergetool")
    use("tpope/vim-fugitive")
    use("voldikss/vim-floaterm")
    use("mgedmin/coverage-highlight.vim")
    use("vimwiki/vimwiki")
    use("direnv/direnv.vim")
    --[[ use("klen/nvim-test") ]]
    --[[ use("rest-nvim/rest.nvim") ]]
    use({
        "nvim-neotest/neotest",
        requires = {
            --[[ "vim-test/vim-test", ]]
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            --[[ "nvim-neotest/neotest-vim-test", ]]
            --[[ "nvim-neotest/neotest-plenary", ]]
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
        },
    })
    --[[ use("simrat39/symbols-outline.nvim") ]]
    use("rhysd/clever-f.vim") -- vimscript
    use("sindrets/diffview.nvim")
    use("jedrzejboczar/possession.nvim")

    -- Debug
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("theHamsta/nvim-dap-virtual-text")

    -- Colorschemes
    use("morhetz/gruvbox")

    -- Copilot
    --[[ use("github/copilot.vim") ]]
    use("zbirenbaum/copilot.lua")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    -- use("mhinz/vim-startify")

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use("jose-elias-alvarez/null-ls.nvim")
    use("folke/trouble.nvim")

    -- Golang
    --[[ use("fatih/vim-go") ]]
    use("ray-x/go.nvim")

    -- Python
    --[[ use("numirias/semshi") ]]

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    -- use "p00f/nvim-ts-rainbow"
    -- use "nvim-treesitter/playground"
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
