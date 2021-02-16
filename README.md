# dotfiles

My personal dotfiles

## Install

```bash
# Clone this repository
git clone git@github.com:bahlo/dotfiles.git ~/.dotfiles

# Link dotfiles, brew install packages (macOS)
cd ~/.dotfiles && make all
```

## iTerm2 configuration

I use the Base16 Unikitty theme and the [iTerm2](https://iterm2.com) Terminal 
emulator on macOS.

Vim automatically switches the appearance based on the system, to get the same
behaviour for iTerm, do the following:

1. Install [Base16 Unikitty Light] and [Base16 Unikitty Dark]
2. Name your default profile `Light` and set the Unikitty Light color preset
3. Duplicate the profile, name it `Dark` and set the Unikitty Dark color preset
4. In iTerm2 go to Menubar → Scripts → Manage → New Python Script
5. Choose `Basic` environment and `Long-Runing Deamon`
6. Copy the contents of [iterm_profile_switch.py](/iterm_profile_switch.py) into
   the iTerm script and run it

iTerm will now set the color preset based on the macOS system appearance.

[Base16 Unikitty Light]: https://github.com/martinlindhe/base16-iterm2/blob/master/itermcolors/base16-unikitty-light-256.itermcolors
[Base16 Unikitty Dark]: https://github.com/martinlindhe/base16-iterm2/blob/master/itermcolors/base16-unikitty-dark-256.itermcolors
