# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#add the nrf command line tools to the path
export PATH=$PATH:/usr/local/nrf_command_line_tools/nrfjprog:/usr/local/nrf_command_line_tools/mergehex

export EDITOR=vim
export TERMINAL=urxvt
export BROWSER=Chromium

export DOTFILES="$HOME/.dotfiles"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &
