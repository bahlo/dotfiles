help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: brew link tpm vim-plug ## This calls all commands in a reasonable order

brew: ## Install Homebrew + packages
	- which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	- cat Brewfile | sed 's/#.*$$//g' | grep -v '^$$' | xargs -n1 brew install

link: ## Link .* to $HOME
	find $(CURDIR) -name ".*" -type f -exec ln -sF {} ~/ ';'

tpm: ## Install TPM + plugins
	- git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	- ~/.tmux/plugins/tpm/scripts/install_plugins.sh

vim-plug: ## Install vim-plug + plugins
	- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	- vim +PlugInstall! +qall

.PHONY: help brew link tpm vim-plug
