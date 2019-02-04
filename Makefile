all: links brew

links:
	[ -f ~/.config/nvim/init.vim ] || mkdir -p ~/.config/nvim && ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.gitignore ] || ln -s $(PWD)/gitignore ~/.gitignore
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

	touch ~/.hushlogin

brew: 
	cat Brewfile | xargs -n1 brew install

clean:
	rm -f ~/.vimrc 
	rm -f ~/.gitignore
	rm -f ~/.zshrc

.PHONY: all links brew clean
