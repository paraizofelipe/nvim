vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'q', ':quit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q', 'q', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-e>', '4<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-y>', '4<c-y>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader>1', ':exec 1 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>2', ':exec 2 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>3', ':exec 3 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>4', ':exec 4 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>5', ':exec 5 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>6', ':exec 6 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>7', ':exec 7 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>8', ':exec 8 . "wincmd w"<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>9', ':exec 9 . "wincmd w"<CR>', {noremap = true})


vim.api.nvim_set_keymap('n', '<A-1>', '<Plug>AirlineSelectTab1', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-2>', '<Plug>AirlineSelectTab2', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-3>', '<Plug>AirlineSelectTab3', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-4>', '<Plug>AirlineSelectTab4', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-5>', '<Plug>AirlineSelectTab5', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-6>', '<Plug>AirlineSelectTab6', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-7>', '<Plug>AirlineSelectTab7', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-8>', '<Plug>AirlineSelectTab8', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-9>', '<Plug>AirlineSelectTab9', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-Left>', '<Plug>AirlineSelectPrevTab', {noremap = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<Plug>AirlineSelectNextTab', {noremap = true })

vim.api.nvim_set_keymap('n', '<leader>', ':Whichkey "<Space>"', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader><c-u>', ':WhichKeyVisual "<Space>"', {noremap = true, silent = true})

vim.g.which_key_map = {}
vim.g.which_key_sep = '→'
-- vim.api.nvim_set_option('timeoutlen', 100)
