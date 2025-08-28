# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#Enviroment variabels

export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export editor='/usr/bin/nvim'
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION="python"
export ALLGON_PLUGIN_SDK=~/dev/ALLGON_SDK/
export TRAB_DIR_INTERCHANGE_V1=$HOME/dev/TRAB_INTERCHANGE_DIR
export TRAB_GIT_ROOT=$HOME/dev/rd
export TCL_LIBRARY=/usr/lib/tcl8.6
export TK_LIBRARY=/usr/lib/tk8.6
export ALLHIL_LOCAL_DIR=~/dev/CI/AllgonHILtestingLib
export USE_LOCAL_ALLHIL=1
export REMOTE_USER=allgon

# My aliases!


alias lynx="lynx -cfg ~/lynx.cfg"
#GIT
alias uncommit="git reset HEAD~1"
alias recommit="git commit --amend --no-edit"
alias editcommit="git commit --amend"

alias run="rofi -show run -normal-window"

# displaylink
alias fix-screen='sudo systemctl restart displaylink-driver.service'

#clipboard
alias clipboard='xclip -sel clip'
#ESP IDF
alias get_idf5.0.1='. ~/esp/esp-idf-v5.0.1/export.sh'
alias get_idf4.4='. ~/esp/esp-idf4.4.4/export.sh'
alias get_idf5.3.1='. ~/esp/esp-idf5.3.1/export.sh'
alias get_idf5.1.4='. ~/esp/esp-idf5.1.4/export.sh'
alias get_idf5.2='. ~/esp/esp-idf5.2/export.sh'
# alias get_idf='. ~/esp/esp-idf/export.sh'
alias get_idf='. $HOME/esp/esp-idf/export.sh'

alias bfm='idf.py build flash monitor'
alias sfm='sleep 3 && idf.py flash monitor' #I use this when programming the TR818 prototype board
alias venv='. ./venv/bin/activate'
alias venvtrablib='. /home/vilhelm/dev/rd/src/SW/SW0026-PC_Software/44-TextFlasherIII/venv/bin/activate'
#TELE_RADIO_SW
# alias tf='/opt/tf3/tf3'
alias tf='/home/vilhelm/dev/rd/src/SW/SW0026-PC_Software/44-TextFlasherIII/tf3.py'
alias f='cd $(find * -type d | fzf)'
#MISC
alias py='python3'
alias vi='nvim'
alias explorer="nautilus --browser ."

#enable z scripts for jumping around faster
. ~/helper_scripts/z.sh


# if [ "$SHLVL" = 1 ]; then -> This makes sure we dont export paths again when launching a subshell.
# This is intenden to allow nvim to use the python venv it's launched in, see this reddit post
# https://www.reddit.com/r/neovim/comments/ga0s7w/use_python_venv_with_neovim/
#
# if [ "$SHLVL" = 1 ]; then
export PATH="/home/vilhelm/.local/bin:$PATH"
export PATH="/opt/trab/bin:$PATH"
export PATH="/home/vilhelm/helper_scripts/:$PATH"
#     export PYENV_ROOT="$HOME/.pyenv"
    # [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# fi

#Fix SM7 MESA LOADER issues
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libstdc++.so.6"

# Change cd to use pushd, and alias popd to "back"
pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
  echo -n "DIRSTACK: "
  dirs
}

pushd_builtin()
{
  builtin pushd > /dev/null
  echo -n "DIRSTACK: "
  dirs
}

popd()
{
  builtin popd > /dev/null
  echo -n "DIRSTACK: "
  dirs
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'

cleanpip() {
    pip freeze | cut -d "@" -f1 | xargs pip uninstall -y
}
