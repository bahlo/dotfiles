# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Load Boxen
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
