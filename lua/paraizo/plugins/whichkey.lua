M = {}

local function load_config()
	local which_key = require("which-key")

	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = false,
				suggestions = 20,
			},

			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		key_labels = {
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		popup_mappings = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		ignore_missing = true,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
		show_help = true,
		triggers = "auto",
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
			n = { "[", "]" },
		},
	})

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local mappings = {
		["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
		["B"] = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["w"] = {
			"<cmd>lua local wid = require('window-picker').pick_window(); if wid then vim.api.nvim_set_current_win(wid) end<CR>",
			"Pick Window",
		},
		-- ["q"] = { "<cmd>q!<CR>", "Quit" },
		-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		["f"] = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find files",
		},
		["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
		b = {
			name = "+buffers",
			d = { "<cmd>Bdelete!<CR>", "Delete Buffer" },
			c = { "<cmd>bwipeout<cr>", "Close buffers" },
			j = { "<cmd>BufferLinePick<cr>", "Jump" },
			l = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},
			n = { "<cmd>bnext<cr>", "Next buffer" },
			p = { "<cmd>bprevious<cr>", "Previous buffer" },
		},
		r = {
			name = "+rest",
			r = { "<Plug>RestNvim<cr>", "Request REST" },
		},
		d = {
			name = "+debug",
			-- DAP
			s = { "<cmd>lua local _, _ = require('dapui').close(), require('dap').close()<cr>", "Stop Debug" },
			r = { "<cmd>lua require('dap').restart()<cr>", "Restart Debug" },
			e = { "<cmd>lua require('dapui').eval()<cr>", "Eval expression" },
			w = { "<cmd>lua require('dapui').watches()<cr>", "Watch values" },
			t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
			C = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoint" },
			c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
			n = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
			o = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
			i = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
			l = {
				"<cmd>lua require('dap.ext.vscode').load_launchjs(vim.fn.getcwd() .. '/launch.json')<cr>",
				"Load launch files",
			},
		},
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		g = {
			name = "Git",
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Diff",
			},
		},
		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			c = { "<cmd>ToggleCoverage<cr>", "Toggle coverage buffer" },
			d = {
				"<cmd>Telescope diagnostics<cr>",
				"Workspace Diagnostics",
			},
			f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			j = {
				"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
				"Next Diagnostic",
			},
			k = {
				"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			-- s = { "<cmd>SymbolsOutline<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
			f = { "<cmd>Telescope find_files<cr>", "Find files" },
			s = {
				"<cmd>Telescope possession list<cr>",
				"Load session with telescope",
			},
			-- s = {
			-- 	"<cmd>Telescope telescope_session<cr>",
			-- 	"Load session with telescope",
			-- },
		},
		a = {
			name = "Applications",
			t = { "<cmd>FloatermNew<cr>", "Terminal" },
			p = { "<cmd>FloatermNew ipython3<cr>", "Python" },
			n = { "<cmd>FloatermNew node<cr>", "Node" },
			d = { "<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 lazydocker<cr>", "Docker" },
			g = { "<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 lazygit<cr>", "Git" },
			r = { "<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 ranger<cr>", "Ranger" },
		},
		t = {
			name = "Tests",
			d = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', "Run tests in debug" },
			a = { '<cmd>lua require("neotest").run.attach()<cr>', "Attach PDB" },
			s = { '<cmd>lua require("neotest").summary.toggle()<cr>', "Show summary tests" },
			r = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run tests" },
			n = { '<cmd>lua require("neotest").run.run()<cr>', "Run nearest" },
			c = { '<cmd>lua require("neotest").run.stop()<cr>', "Stop test" },
			o = { '<cmd>lua require("neotest").output.open({ enter = true })<cr>', "Show output" },
			v = { "<cmd>HighlightCoverage<cr>", "Coverage" },
		},
		m = {
			name = "Mergetools",
			t = { "<cmd>MergetoolToggle<cr>", "MergetoolToggle" },
			l = { "<cmd>MergetoolPreferLocal<cr>", "MergetoolPreferLocal" },
			r = { "<cmd>MergetoolPreferRemote<cr>", "MergetoolPreferRemote" },
		},
		q = {
			name = "Sessions",
			s = { "<cmd>:Telescope session-lens search_session<CR><cr>", "Search of directory" },
		},
	}

	local vopts = {
		mode = "v",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
	local vmappings = {
		["/"] = { '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
		r = {
			x = { "<ESC><cmd>SnipRun<CR>", "Exec code" },
			r = { "<ESC><cmd>SnipReset<CR>", "Reset code" },
			c = { "<ESC><cmd>SnipClose<CR>", "Close run" },
		},
	}

	which_key.register(mappings, opts)
	which_key.register(vmappings, vopts)
end

M.lazy = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = load_config,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}

return M.lazy
