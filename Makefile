
validate-python:
	@command -v python3 >/dev/null 2>&1 && echo Python 3 is installed

validate-node:
	@command -v node >/dev/null 2>&1 && echo Node is installed

build-python-env: validate-python
	@pip install --upgrade pip
	@pip3 install virtualenv
	@virtualenv ~/.config/nvim/general/hosts/.venv
	~/.config/nvim/general/hosts/.venv/bin/pip install pynvim neovim

build-node-env: validate-node
	@npm install neovim

build: build-node-env build-python-env
	@nvim +'checkhealth'

install: build
	@nvim +'source init.vim' +qa
	@nvim +'PluginInstall --sync' +qa
	@nvim +'CocInstall maketplace coc-python coc-explorer' +qa
