vim.g.wiki = {}
vim.g.wiki.path = '~/notes/'
vim.g.syntax = 'markdown'
vim.g.ext = '.md'
vim.g.automatic_nested_syntaxes = 1
vim.g.wiki.nested_syntaxes = { python = 'python', go = 'go', json = 'json', yaml = 'yaml', bash = 'bash' }
vim.g.auto_tags = 1
vim.g.vimwiki_folding = 'list'

vim.cmd([[
function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction
]])

vim.cmd([[
function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction
]])

vim.api.nvim_set_keymap('n', '<leader>wa', ':call VimwikiFindAllIncompleteTasks()<CR>', { expr = true })
vim.api.nvim_set_keymap('n', '<leader>wx', ':call VimwikiFindIncompleteTasks()<CR>', { expr = true })
