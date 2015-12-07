# dotfiles

These are my dotfiles. Vim, ZSH, Tmux, Brew, all the good stuff.

## Usage

### Installation

1. Install Xcode and run the following code in your terminal:

```bash
# Install Developer Tools
xcode-select --install

# Install Homebrew (http://brew.sh) 
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install Ansible  (http://www.ansible.com)
brew install ansible

# Clone dotfiles
git clone https://github.com/bahlo/dotfiles.git ~/dotfiles

# Run playbook
cd ~/dotfiles/playbooks && ansible-playbook -i inventory osx.yml
```
