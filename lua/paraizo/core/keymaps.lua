local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-e>", "4<C-e>", opts)
keymap("n", "<C-y>", "4<C-y>", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment').toggle()<CR>", opts)
keymap("v", "<leader>/", ':lua require("Comment.api").gc(vim.fn.visualmode())<cr>', opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>f", ":Format<cr>", opts)

-- keymap("n", "<leader>1", ':exec 1 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>2", ':exec 2 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>3", ':exec 3 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>4", ':exec 4 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>5", ':exec 5 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>6", ':exec 6 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>7", ':exec 7 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>8", ':exec 8 . "wincmd w"<CR>', { noremap = true })
-- keymap("n", "<leader>9", ':exec 9 . "wincmd w"<CR>', { noremap = true })

-- Barbar
-- keymap("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
-- keymap("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
-- keymap("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
-- keymap("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
-- keymap("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
-- keymap("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
-- keymap("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
-- keymap("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
-- keymap("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
-- keymap("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)

-- BufferLine
-- keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
-- keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
-- keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
-- keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
-- keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
-- keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
-- keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
-- keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
-- keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Floaterm
keymap("n", "<F1>", "<Cmd>FloatermToggle<CR>", opts)
keymap("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>")
keymap("n", "<F2>", "<Cmd>FloatermNext<CR>", opts)
keymap("t", "<F2>", "<C-\\><C-n><Cmd>FloatermNext<CR>", opts)
keymap("n", "<F3>", "<Cmd>FloatermPrev<CR>", opts)
keymap("t", "<F3>", "<C-\\><C-n><Cmd>FloatermPrev<CR>", opts)
keymap("n", "<F4>", "<Cmd>FloatermNew<CR>", opts)
keymap("t", "<F4>", "<C-\\><C-n><Cmd>FloatermNew<CR>", opts)
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- vim.keymap.set("i", "<C-g>", function()
-- 	return vim.fn["codeium#Accept"]()
-- end, { expr = true })
-- vim.keymap.set("i", "<C-L>", function()
-- 	return vim.fn["codeium#CycleCompletions"](1)
-- end, { expr = true })
-- vim.keymap.set("i", "<C-H>", function()
-- 	return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true })
-- vim.keymap.set("i", "<C-x>", function()
-- 	return vim.fn["codeium#Clear"]()
-- end, { expr = true })
