" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

silent! unmap <leader>b
silent! unmap <leader>t
silent! unmap <leader>cl

" Hide keys
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map.ba = 'which_key_ignore'
let g:which_key_map.bd = 'which_key_ignore'

let g:which_key_map.b = {
    \ 'name' : '+buffers' ,
    \ 'd' : [':BD'  , 'Delete buffers'],
    \ 'w' : [':BW'  , 'Wipe buffers'],
    \ }

let g:which_key_map.c = {
    \ 'name' : '+comment' ,
    \ 'l' : ['<plug>NERDCommenterToggle'  , 'comment line'],
    \ }

" c is for floaterm
let g:which_key_map.t = {
    \ 'name' : '+terminal' ,
    \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
    \ 'g' : [':FloatermNew lazygit'                           , 'git'],
    \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
    \ 'n' : [':FloatermNew node'                              , 'node'],
    \ 'p' : [':FloatermNew python'                            , 'python'],
    \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
    \ 't' : [':FloatermToggle'                                , 'toggle'],
    \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
    \ }

let g:which_key_map.l = {
    \ 'name' : '+golang',
    \ 'b' : [':GoBuild', 'go build'],
    \ 'c' : [':GoCoverageToggle', 'go coverage toggle'],
    \ 'd' : [':GoDoc', 'go doc'],
    \ 'g' : [':GoDef', 'go def'],
    \ 'i' : [':GoImplements', 'go implements'],
    \ 'k' : [':GoDebugBreakpoint', 'go add breakpoint'],
    \ 's' : [':GoDebugStart', 'go start debug'],
    \ 'S' : [':GoDebugStop', 'go stop debug'],
    \ 't' : [':GoTest', 'go test'],
    \ 'x' : [':GoImplements', 'go implements'],
    \ }

let g:which_key_map.n = {
    \ 'name' : '+nvim',
    \ 'i' : [':e ~/.config/nvim/init.vim', 'edit init config'],
    \ 'p' : [':e ~/.config/nvim/vim-plug/plugins.vim', 'edit plug config'],
    \ 'g' : [':e ~/.config/nvim/general/settings.vim', 'edit general settings'],
    \ }
    
 


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
