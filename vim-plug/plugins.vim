let langs = ['vim', 'go', 'python', 'lua']

" auto-install vim-plug
call plug#begin('~/.config/nvim/autoload/plugged')

    " Polyglot syntax better
    Plug 'sheerun/vim-polyglot'

    " SQHeaven - A lightweight SQL wrapper
    Plug 'paraizofelipe/sqheaven.nvim'
    " GoodNight - A lightweight request client
    Plug 'paraizofelipe/good-night.nvim'
    Plug 'file://'.expand('~/projects/translator.nvim')

    " Ale
    Plug 'dense-analysis/ale', { 'do': 'pip install pylint isort black yamllint && npm install jsonlint prettier' }
    
    " Deoplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim', { 'for': langs }
    " Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

    " Completion-nvim
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim', { 'for': langs }
    " Plug 'lifepillar/vim-mucomplete', { 'for': langs }

    " Vim-Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
    
    " Lua lang
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'xolox/vim-misc'
    
    " VimWiki
    Plug 'vimwiki/vimwiki'

    " COC Intellisense
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc-denite'

    " Python Jedi
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }

    " Syntax python with Semshi
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}

    " Virtual envs and packages python with Poetry
    " Plug 'petobens/poet-v'

    " VIM vinegar
    Plug 'tpope/vim-vinegar'

    "Vim-Mergetool
    Plug 'samoshkin/vim-mergetool'

    " Markdown
    " Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

    " Vim-visual-multi
    Plug 'mg979/vim-visual-multi'
    
    " Theme
    Plug 'morhetz/gruvbox'
    
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Startify
    Plug 'mhinz/vim-startify'

    " Cool Icons
    Plug 'ryanoasis/vim-devicons'

    " Vista
    Plug 'liuchengxu/vista.vim'
    
    "Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    
    " Sneak
    Plug 'justinmk/vim-sneak'
 
    " CtrlSpace
    Plug 'vim-ctrlspace/vim-ctrlspace'

    " Clever-f
    Plug 'rhysd/clever-f.vim'   

    " Which Keys
    Plug 'liuchengxu/vim-which-key'

    " NERD Commenter
    Plug 'preservim/nerdcommenter'

    " Floaterm
    " read docs to use lazydocker and lazygit
    " https://github.com/jesseduffield/lazydocker
    " https://github.com/jesseduffield/lazygit
    Plug 'voldikss/vim-floaterm'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Ack
    " Plug 'mileszs/ack.vim'

    " Rg
    " Plug 'jremmen/vim-ripgrep'

    " Ag
    " Plug 'rking/ag.vim'

call plug#end()

" List of all loaded scripts in a VIM buffer
function! s:Scratch (command, ...)
   redir => lines
   let saveMore = &more
   set nomore
   execute a:command
   redir END
   let &more = saveMore
   call feedkeys("\<cr>")
   new | setlocal buftype=nofile bufhidden=hide noswapfile
   put=lines
   if a:0 > 0
      execute 'vglobal/'.a:1.'/delete'
   endif
   if a:command == 'scriptnames'
      %substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
   endif
   silent %substitute/\%^\_s*\n\|\_s*\%$
   let height = line('$') + 3
   execute 'normal! z'.height."\<cr>"
   0
endfunction

command! -nargs=? Scriptnames call <sid>Scratch('scriptnames', <f-args>)
command! -nargs=+ Scratch call <sid>Scratch(<f-args>)
