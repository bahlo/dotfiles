all: links brew

links:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.alacritty.yml
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.gitignore ] || ln -s $(PWD)/gitignore ~/.gitignore
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

	touch ~/.hushlogin

brew: 
	cat Brewfile | xargs -n1 brew install

clean:
	rm -f ~/.vimrc 
	rm -f ~/.alacritty.yml
	rm -f ~/.tmux.conf
	rm -f ~/.gitignore
	rm -f ~/.zshrc

.PHONY: all links brew clean
