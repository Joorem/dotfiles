#!/usr/bin/env bash

set -e
set -u

ETC_ARIA2C_SRV_NAME='net.joworld.aria2c'
DIR_LAUNCH_AGENTS=~/Library/LaunchAgents
DIR_SUBLIME_TEXT=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
DIR_VSCODE=~/Library/Application\ Support/Code/User
PRG_ARIA2C=/usr/local/aria2/bin/aria2c
PRG_LAUNCHCTL=/bin/launchctl

# Sublime Text
if [ -d "${DIR_SUBLIME_TEXT}" ]; then
  cp resources/Preferences.sublime-settings "$DIR_SUBLIME_TEXT/Preferences.sublime-settings"
  cp resources/Default\ \(OSX\).sublime-keymap "$DIR_SUBLIME_TEXT/Default (OSX).sublime-keymap"
  cp resources/Package\ Control.sublime-settings "$DIR_SUBLIME_TEXT/Package\ Control.sublime-settings"
fi

# VSCode
ln -fs "$PWD/.config/vscode/settings.json" "$DIR_VSCODE/settings.json"

# Aria2c
if [ -d "${DIR_LAUNCH_AGENTS}" ]; then
  if [ ! -e "${DIR_LAUNCH_AGENTS}/${ETC_ARIA2C_SRV_NAME}.plist" ]; then
    cat <<EOF >"${DIR_LAUNCH_AGENTS}/${ETC_ARIA2C_SRV_NAME}.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${ETC_ARIA2C_SRV_NAME}</string>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
        <string>${PRG_ARIA2C}</string>
        <string>--conf-path=${HOME}/.config/aria2c/aria2.conf</string>
    </array>
</dict>
</plist>
EOF
    ${PRG_LAUNCHCTL} load ${DIR_LAUNCH_AGENTS}/net.joworld.aria2c.plist
  fi
fi
