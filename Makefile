all: links brew

links:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
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
