##################### Plugins #####################
source ~/.config/zplug/init.zsh

zplug "k4rthik/git-cal", as:command
zplug "zpm-zsh/mysql-colorize"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

##################### Options #####################
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt append_history hist_ignore_all_dups hist_reduce_blanks
setopt autocd
setopt interactivecomments
setopt nocheckjobs
setopt nohup
unsetopt beep

# Color vars
autoload -U colors terminfo
colors

# Smart completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Zargs pawa
autoload -U zargs

#################### Completion ####################
zmodload -a autocomplete
zmodload -a complist

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "%B%d%d"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*' group-name ''

zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:rm:*' ignore-line yes
# color for completion
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
# menu for auto-completion
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# Completion Menu for kill
zstyle ':completion:*:processes' command 'ps -aux'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
# Cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache

#################### Functions ####################
drill-color () {
  drill $* | awk '
    !/^;/    { print "\033[32m"$0 }
    /^;;/    { print "\033[36m"$0 }
    END      { print "\033[0m" }
  ';
}

dig-color () {
  dig $* | awk '
    !/^;/    { print "\033[32m"$0 }
    /^;;/    { print "\033[36m"$0 }
    END      { print "\033[0m" }
  ';
}

###################### Alias #######################
alias c=clear
alias cat=bat
alias df='df -h'
alias dig=dig-color
alias drill='drill-color'
alias grep="LC_ALL=C grep --color=always"
alias l='lsd --long --human-readable --color always --size short'
alias ll='l --all'
alias meteo="curl http://wttr.in"
alias s='su -'
alias vcurl='curl --silent --dump-header - -o /dev/null'
alias vi=nvim
alias view='vi -R'

###################### Bindkeys #######################
bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char                  # Fn + Delete
bindkey '^[[A' history-substring-search-up   # Up
bindkey '^[[B' history-substring-search-down # Down

eval "$(starship init zsh)"
