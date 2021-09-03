vim.g.vimspector_enable_mappings = 'HUMAN'

vim.api.nvim_set_keymap('n', '<A-1>', '<Plug>AirlineSelectTab1', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vl', ':call vimspector#Launch()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vr', ':VimspectorReset<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ve', ':VimspectorEval', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vw', ':VimspectorWatch', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vo', ':VimspectorShowOutput', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vi', '<Plug>VimspectorBalloonEval', {noremap = true})
vim.api.nvim_set_keymap('x', '<leader>vi', '<Plug>VimspectorBalloonEval', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>db', ':call vimspector#ToggleBreakpoint()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dC', ':call vimspector#ClearBreakpoints()<CR>', {noremap = true})

vim.g.vimspector_install_gadgets = {'debugpy'}
