vim.g.mapleader = "<Space>"
vim.cmd("syntax enable")
vim.cmd("set hidden")
vim.cmd("set nowrap")
vim.cmd("set encoding=utf-8")
vim.cmd("set pumheight=10")
vim.cmd("set fileencoding=utf-8")
vim.cmd("set ruler")
vim.cmd("set cmdheight=1")
vim.cmd("set iskeyword+=-")
vim.cmd("set mouse=")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
vim.cmd("set t_Co=256")
vim.cmd("set conceallevel=0")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set autoindent")
-- vim.cmd("set laststatus=0")
-- vim.cmd("set list lcs=tab:\|")
vim.cmd("set showtabline=1")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.cmd("set cursorline")
vim.cmd("set background=dark")
vim.cmd("set noshowmode")
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set updatetime=300")
vim.cmd("set timeoutlen=500")
vim.cmd("set formatoptions-=cro")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set nofoldenable")
vim.cmd("set foldmethod=indent")
vim.cmd("set confirm")
vim.cmd("set showcmd")
vim.cmd("set cc=123")
vim.cmd("set completeopt-=preview")

-- Python 
vim.g.python3_host_prog = '~/.config/nvim/host/python-nvim/bin/python'

-- NodeJS
-- vim.g.node_host_prog = ''

-- Settings to netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

vim.api.nvim_exec([[
    augroup long_lines
        autocmd!
        autocmd FileType qf wincmd J
        autocmd FileType help wincmd K
    augroup END
]], false)

vim.api.nvim_exec([[
    function! TabMessage(cmd)
        redir => message
        silent execute a:cmd
        redir END
        if empty(message)
            echoerr "no output"
        else
            " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
            tabnew
            setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
            silent put=message
        endif
    endfunction
    command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
]], false)
