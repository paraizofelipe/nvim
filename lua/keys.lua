vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'q', ':quit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q', 'q', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-e>', '4<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-y>', '4<c-y>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>1', ':exec 1 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2', ':exec 2 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>3', ':exec 3 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>4', ':exec 4 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', ':exec 5 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>6', ':exec 6 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>7', ':exec 7 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>8', ':exec 8 . "wincmd w"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>9', ':exec 9 . "wincmd w"<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>', ':Whichkey "<Space>"', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader><c-u>', ':WhichKeyVisual "<Space>"', {noremap = true, silent = true})

vim.g.which_key_map = {}
vim.g.which_key_sep = '→'
-- vim.api.nvim_set_option('timeoutlen', 100)
