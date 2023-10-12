local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Colorschemes
	{ "ellisonleao/gruvbox.nvim", lazy = true, priority = 1000, tag = "2.0.0" },

	-- Git
	{ "lewis6991/gitsigns.nvim", lazy = true, tag = "v0.6" },
	{ "tpope/vim-fugitive", lazy = true, cmd = { "Git" } },

	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "windwp/nvim-autopairs", lazy = true },
	{ "numToStr/Comment.nvim", lazy = true },
	-- {"ryanoasis/vim-devicons", lazy = true},
	-- {"kyazdani42/nvim-web-devicons", lazy = true},
	{ "kyazdani42/nvim-tree.lua", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- {"jose-elias-alvarez/buftabline.nvim") -- Deprecated.lazy,
	{ "akinsho/bufferline.nvim", lazy = true },
	-- {"romgrk/barbar.nvim", lazy = true},
	{ "moll/vim-bbye", lazy = true, cmd = "Bdelete" },
	{ "nvim-lualine/lualine.nvim", lazy = true },
	{ "ahmedkhalf/project.nvim", lazy = true },
	{ "lewis6991/impatient.nvim", lazy = true },
	{ "lukas-reineke/indent-blankline.nvim", lazy = true },
	{ "goolord/alpha-nvim", lazy = true },
	{ "folke/which-key.nvim", lazy = true },
	{
		"mg979/vim-visual-multi",
		lazy = true,
		keys = {
			{ "<C-n>", mode = "n" },
			{ "<C-Up>", mode = "n" },
			{ "<C-Down>", mode = "n" },
			{ "<C-n>", mode = "v" },
		},
	},
	-- {"samoshkin/vim-mergetool", lazy = true},
	{ "voldikss/vim-floaterm", lazy = false },
	{ "mgedmin/coverage-highlight.vim", lazy = true },
	-- {"vimwiki/vimwiki", lazy = true},
	{ "direnv/direnv.vim", lazy = false },
	{ "RRethy/vim-illuminate", lazy = false },

	-- {"klen/nvim-test", lazy = true},
	-- {"rest-nvim/rest.nvim", lazy = true},
	{ "nvim-neotest/neotest", lazy = true },
	{ "nvim-neotest/neotest-go", lazy = true, ft = "go" },
	{ "nvim-neotest/neotest-python", lazy = true, ft = "python" },
	-- {"simrat39/symbols-outline.nvim", lazy = true},
	{ "rhysd/clever-f.vim", lazy = false }, -- vimscript
	-- { "ggandor/lightspeed.nvim", lazy = true },
	{ "sindrets/diffview.nvim", lazy = true, cmd = "DiffviewOpen" },
	-- {"jedrzejboczar/possession.nvim", lazy = true},
	{ "folke/persistence.nvim", lazy = true },
	-- {"SmiteshP/nvim-navic", lazy = true},
	-- { "MunifTanjim/nui.nvim", lazy = true },

	-- Debug
	{ "mfussenegger/nvim-dap", keys = { "<leader>d", mode = "n" }, lazy = true },
	{ "rcarriga/nvim-dap-ui", keys = { "<leader>d", mode = "n" }, lazy = true },
	{ "theHamsta/nvim-dap-virtual-text", keys = { "<leader>d", mode = "n" }, lazy = true },
	{ "mfussenegger/nvim-dap-python", keys = { "<leader>d", mode = "n" }, lazy = true, ft = "python" },
	{ "nvim-telescope/telescope-dap.nvim", keys = { "<leader>d", mode = "n" }, lazy = true },

	-- IA
	-- {"Exafunction/codeium.vim", lazy = true},
	-- {"github/copilot.vim", lazy = true},
	{ "zbirenbaum/copilot.lua", lazy = true },

	-- CMP plugins
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
		lazy = true,
	}, -- The completion plugin

	-- Snippets
	-- {"L3MON4D3/LuaSnip", lazy = true}, --snippet engine
	-- { "rafamadriz/friendly-snippets", lazy = true }, -- a bunch of snippets to use

	-- LSP
	{ "neovim/nvim-lspconfig", lazy = true }, -- enable LSP
	{ "williamboman/mason.nvim", lazy = true },
	{ "williamboman/mason-lspconfig.nvim", lazy = true },
	{ "mfussenegger/nvim-lint", lazy = true },
	{ "mhartington/formatter.nvim", lazy = true },
	{ "folke/trouble.nvim", lazy = true, cmd = "Trouble" },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", lazy = true },
	{ "nvim-telescope/telescope-media-files.nvim", lazy = true },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = true },
	-- use "p00f/nvim-ts-rainbow"

	-- { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },

	require("user.nvim-window-picker").lazy,
}

local opts = {}

require("lazy").setup(plugins, opts)
