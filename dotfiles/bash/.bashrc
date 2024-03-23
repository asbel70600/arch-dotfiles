# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# usability options
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# env variables
HISTSIZE=-1
HISTCONTROL=ignoreboth
HISTFILESIZE=-1
HISTFILE=$XDG_CONFIG_HOME/dotfiles/.bash_history
W3M_DIR=$XDG_CONFIG_HOME/.w3m
export QT_STYLE_OVERRIDE=kvantum

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export WWW_HOME=$XDG_CONFIG_HOME/w3m



# enable autocompletion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi



# personalization
PS1=$'\n\n\u2320 [\T] [\u] [\w] dx\n\u2321 -> '
source $XDG_CONFIG_HOME/dotfiles/.bash_aliases
