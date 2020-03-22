###############################################################
# Plugins
###############################################################

fundle plugin oh-my-fish/theme-bobthefish
fundle init

#
# theme-bobthefish (https://github.com/oh-my-fish/theme-bobthefish)
#
set -g theme_color_scheme gruvbox
set -g theme_display_cmd_duration no
set -g theme_display_date no
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no
set -g theme_show_exit_status no


###############################################################
# Alias
###############################################################

alias aria2c="aria2c --conf-path=$HOME/.config/aria2c/aria2.conf"
alias c=clear
alias df='df -h'
alias l='ls -lh'
alias ll='ls -alh'
alias meteo="curl http://wttr.in"
alias s='su -'
alias puppet-lint='puppet-lint --no-2sp_soft_tabs-check --no-80chars-check'
alias pfsi='pfctl -si'
alias pfssh='pfctl -t ssh-bruteforce -T show'
alias vi=nvim
alias vcurl='curl --silent --dump-header - -o /dev/null'
alias view='vi -R'
