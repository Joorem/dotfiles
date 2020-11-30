##################### Plugins #####################
source ~/.config/zplug/init.zsh

zplug "k4rthik/git-cal", as:command
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

transmission-list-torrent () {
  if (( $# == 0 )) then
    transmission-remote --list
  else
    while (($#)) do
      transmission-remote --list|grep -i "$1"
      shift
    done
  fi
}

transmission-remove-torrent () {
  if (( $# == 0 )) then
    return
  fi

  while (($#)) do
    ids+=$(transmission-remote --list|awk "tolower(\$0) ~ /$1/{printf \"%s,\", \$1}")
    shift
  done

   transmission-remote --torrent "$ids" --list
   printf "\n\nDelete those torrents? "
   read ans

   transmission-remote --torrent "$ids" --remove-and-delete
}

###################### Alias #######################
alias aria2c="aria2c --conf-path=$HOME/.config/aria2c/aria2.conf"
alias c=clear
alias cat=bat
alias df='df -h'
alias dig=dig-color
alias drill='drill-color'
alias grep="LC_ALL=C grep --color=always"
alias l='lsd --long --human-readable --color always --size short'
alias ll='l --all'
alias llt='ll --tree'
alias meteo="curl http://wttr.in"
alias s='su -'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias tad="transmission-remote --add"
alias tol='transmission-list-torrent'
alias tor='transmission-remove-torrent'
alias vcurl='curl --silent --dump-header - -o /dev/null'
alias vi=vim
alias view='vi -R'

###################### Bindkeys #######################
bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char                  # Fn + Delete
bindkey '^[[A' history-substring-search-up   # Up
bindkey '^[[B' history-substring-search-down # Down

###################### Prompt #######################
eval "$(starship init zsh)"

###################### LS_COLORS #######################
ETC_NORD_COLORS=~/.config/nord-dircolors/src/dir_colors

if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -r "$ETC_NORD_COLORS" ] && eval $(gdircolors -b $ETC_NORD_COLORS)
else
  [ -r "$ETC_NORD_COLORS" ] && eval $(dircolors -b $ETC_NORD_COLORS)
fi
