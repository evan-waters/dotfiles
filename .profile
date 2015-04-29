# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Git tab  completion
if [ -d /Applications/Xcode.app/Contents/Developer/usr/share/git-core ] ; then
  source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash"
  source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"
fi
if [ -f ~/.git-completion.bash ] ; then
  source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ] ; then
  source ~/.git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='\t:\[\e[0;32m\]$(__git_ps1 " (%s)")\[\e[0m\]\W \u@\H\$ '

# Terminal colors
if [[ $TERM == *"screen"* ]] ; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

# Path
export PATH=${PATH}:~/bin

# Trelora
export PRE_WORKSPACE=/home/iancrosser
export WORKSPACE=/Projects/gpigs-core

# Aliases
if [ -f ~/.bash_aliases ] ; then
  source ~/.bash_aliases
fi

