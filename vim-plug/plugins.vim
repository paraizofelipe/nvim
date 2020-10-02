" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Ale
    Plug 'dense-analysis/ale', { 'do': 'pip install pylint isort black' }
    
    " Vim-Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " COC Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}"
    
    " Deoplete
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'Shougo/echodoc.vim'
    " Plug 'deoplete-plugins/deoplete-jedi'

    " Python Jedi
    " Plug 'davidhalter/jedi-vim'
    
    " Completion-nvim
    " Plug 'lifepillar/vim-mucomplete'
    " Plug 'nvim-lua/completion-nvim'

    " VIM vinegar
    " Plug 'tpope/vim-vinegar'

    "Vim-Mergetool
    Plug 'samoshkin/vim-mergetool'

    " Markdown
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

    " Vim-visual-multi
    Plug 'mg979/vim-visual-multi'
    
    " Theme
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    
    " BufferKill
    Plug 'qpkorr/vim-bufkill'

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
    Plug 'mileszs/ack.vim'

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
