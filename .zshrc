HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt append_history hist_ignore_all_dups hist_reduce_blanks
setopt nocheckjobs
setopt nohup

##################### Options #####################
setopt autocd
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

# Env
export CLICOLOR=1
export EDITOR='vim'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PATH="$PATH:/opt/local/bin"
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;40;92m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

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

###################### Alias #######################
alias c='clear'
alias df='df -h -t ufs'
alias drill='drill-color'
alias grep="LC_ALL=C /usr/bin/grep --color=always"
alias kk='ssh selenos.as30781.net'
alias ll='ls -alh'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias lol='~/Documents/Tools/nyancat/src/nyancat -n'
alias meteo="curl http://wttr.in"
alias s='su -'
alias ssp='ssh -l jorem joworld.net'
alias pfsi='pfctl -si'
alias pfssh='pfctl -t ssh-bruteforce -T show'
alias uaFirefox='defaults write com.apple.Safari CustomUserAgent "\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11_0; rv:38.0) Gecko/20100101 Firefox/38.0\"" && killall Safari; sleep 2; open -a /Applications/Safari.app'
alias uaSafari='defaults write com.apple.Safari CustomUserAgent "\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/601.1.56 (KHTML, like Gecko) Version/9.0 Safari/601.1.56\"" && killall Safari; sleep 2; open -a /Applications/Safari.app'
alias vi='vim'
alias vcurl='curl --silent --dump-header - -o /dev/null'
alias view='vi -R'
alias wup='sudo ifconfig en0 up'
alias wdn='sudo ifconfig en0 down'

###################### Bindkeys #######################
bindkey "^[[3~" delete-char		# Fn + Delete

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

  local user_at_host="%{${user_color}%}%n%{${fg[magenta]}%}@%{${fg[blue]}%}%M"

  PROMPT="${user_at_host} %f- %{${fg[red]}%}%y %f- %{${fg[yellow]}%}%* %f[%h]
%f%~%# %f"
}
