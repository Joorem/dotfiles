##################### Options #####################
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt append_history hist_ignore_all_dups hist_reduce_blanks
setopt autocd
setopt nocheckjobs
setopt nohup
unsetopt beep

source ~/.zsh/zsh-git-prompt/zshrc.sh

# Color vars
autoload -U colors terminfo
colors

# Smart completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Zargs pawa
autoload -U zargs

hash -d ports=/usr/ports
hash -d src=/usr/src

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

send-SSH-pubkey () {
  PUBKEY=$(cat ~/.ssh/id_rsa.pub)
  ssh $1 "mkdir -p .ssh; chmod 700 .ssh; echo $PUBKEY >>.ssh/authorized_keys"
}

###################### Alias #######################
alias c=clear
alias df='df -h'
alias dig=dig-color
alias drill='drill-color'
alias grep="LC_ALL=C grep --color=always"
alias l='ls -lh'
alias ll='ls -alh'
alias lol="$HOME/Documents/Tools/nyancat/src/nyancat -n"
alias meteo="curl http://wttr.in"
alias s='su -'
alias puppet-lint='puppet-lint --no-2sp_soft_tabs-check --no-80chars-check'
alias ssp='ssh -l jorem eva.joworld.net'
alias pfsi='pfctl -si'
alias pfssh='pfctl -t ssh-bruteforce -T show'
alias vi=vim
alias vcurl='curl --silent --dump-header - -o /dev/null'
alias view='vi -R'

###################### Bindkeys #######################
bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char # Fn + Delete

function title {
  t="%n@%m %~ %y"

  case $TERM in
    *xterm*|(u|dt|k|E)term)
      print -nP "\e]0;${t}\a"
    ;;
  esac
}

function precmd {
  title

  if [[ $UID -eq 0 ]]; then
    local user_color="${fg[green]}"
  else
    local user_color="${fg[cyan]}"
  fi

  local user_at_host="%{${user_color}%}%n%{${fg[magenta]}%}@%{${fg[blue]}%}%m"

  PROMPT="${user_at_host} $(git_super_status)%f%~ > "
}
