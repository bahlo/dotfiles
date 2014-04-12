# Navigation
alias ..="cd .."
alias -g ...="cd ../.."
alias -g ....="cd ../../.."
alias -g .....="cd ../../../.."
alias -g ......="cd ../../../../.."

# List all files colorized in long format, including dot files
alias -g la="ls -la ${colorflag}"

# Add -i to every crontab command to ask everytime before deleting (don't ask)
alias crontab="crontab -i"

# Alias gti to git
alias gti="git"

# Use colors when GNU grep with color-support
alias grep="grep --color=auto"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# from @nvie https://coderwall.com/p/4tkkpq
#
# ls **/*.zsh | map dirname
alias map="xargs -n1"

# OS X
if [[ $(uname -s) == 'Darwin' ]]; then
    # Cleanup terminal logfiles, via http://osxdaily.com/2010/05/06/speed-up-a-slow-terminal-by-clearing-log-files/
    alias terminal_clean="sudo rm -rf /private/var/log/asl/*.asl"

    # Flush the DNS cache, again
    alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

    # Lock the system
    alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

    # Update alias to update OS X, Homebrew, Node packages and Ruby gems
    alias update="sudo -v; sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update"

    # Copy the working dir to the clipboard
    alias cpwd='pwd|xargs echo -n|pbcopy'
fi
