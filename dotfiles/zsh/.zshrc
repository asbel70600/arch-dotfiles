# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LANG=en_US.UTF-8
export ZSH=/home/asbel/.xdg/config/.oh-my-zsh
export ZSH_CUSTOM=/home/asbel/.xdg/config/.oh-my-zsh/custom
source $ZSH/oh-my-zsh.sh

ZSH_THEME="xiong-chiamiov"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="dd/mm/yyyy"
HYPHEN_INSENSITIVE="false"
CASE_SENSITIVE="false"
HISTFILE=$XDG_CONFIG_HOME/dotfiles/zsh/.zsh_history
HISTSIZE=-1
HISTFILESIZE=-1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a3a5a8,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 30
zstyle ':omz:*' aliases no

source $ZSH/oh-my-zsh.sh
source /home/asbel/.xdg/config/dotfiles/bash/.bash_aliases


plugins=(
    git
    command-not-found
    flutter
    composer
    docker
    gh
    gitfast
    git-prompt
    laravel5
    pip
    zoxide
)

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

bindkey '^ ' autosuggest-accept
bindkey '\e' autosuggest-clear


PS1=$'
%{\e[0;34m%}%B\u2320%b%{\e[0m%} %{\e[0;34m%}%B[%b%{\e[0m%}%B%T%b%{\e[0;34m%}%B]%b%{\e[0m%} %{\e[0;34m%}%B[%b%{\e[0m%}%B%w%b%{\e[0;34m%}%B]%b%{\e[0m%} %{\e[0;34m%}%B[%b%{\e[0m%}%B%~%b%{\e[0;34m%}%B]%b%{\e[0m%} %{\e[0;34m%}%Bdx%b%{\e[0m%}
%{\e[0;34m%}%B\u2321%b%{\e[0m%} %B->%b '
