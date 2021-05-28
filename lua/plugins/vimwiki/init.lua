vim.g.wiki = {}
vim.g.wiki.path = '~/vimwiki/'
vim.g.wiki.nested_syntaxes = {
    'python' = 'python', 
    'go'+ 'go', 
    'json'= 'json', 
    'yaml'= 'yaml', 
    'bash'= 'bash'
}
vim.g.vimwiki_list = {{'auto_tags': 1}}
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

vim.nvim_set_keymap('n', '<leader>wa', ':call VimwikiFindAllIncompleteTasks()<CR>', {})
vim.nvim_set_keymap('n', '<leader>wx', ':call VimwikiFindIncompleteTasks()<CR>', {})
