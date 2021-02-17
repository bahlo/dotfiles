all: link-vimrc link-zshrc link-tmuxconf link-gitconfig brew

link-zshrc:
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc

link-vimrc:
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc

link-tmuxconf:
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/.tmux.conf ~/.tmux.conf

link-gitconfig:
	[ -f ~/.gitconfig ] || ln -s $(PWD)/.gitconfig ~/.gitconfig

link-starship:
	mkdir -p ~/.config
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

brew: 
	cat Brewfile | xargs -n1 brew install
	brew install --HEAD universal-ctags/universal-ctags/universal-ctags # No formula

.PHONY: all link-zshrc link-vimrc link-tmuxconf link-gitconfig brew link-starship
