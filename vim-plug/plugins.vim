" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Ale
    Plug 'dense-analysis/ale'
    
    " Vim-Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Jedi-python
    Plug 'davidhalter/jedi-vim'

    "Vim-Mergetool
    Plug 'samoshkin/vim-mergetool'

    " Markdown
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

    " Vim-visual-multi
    Plug 'mg979/vim-visual-multi'

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}"
    
    " Theme
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    
    " BufferKill
    Plug 'qpkorr/vim-bufkill'

    " Vim-orgmode
    Plug 'jceb/vim-orgmode'

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
