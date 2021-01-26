#!/usr/bin/env bash

set -e
set -u

ETC_ARIA2C_SRV_NAME='net.joworld.aria2c'
ETC_DNSCRYPT_CONF=dnscrypt-proxy.toml
DIR_LAUNCH_AGENTS=~/Library/LaunchAgents
DIR_DNSCRYPT=/usr/local/etc
DIR_SUBLIME_TEXT=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
DIR_VSCODE=~/Library/Application\ Support/Code/User
PRG_ARIA2C=/usr/local/aria2/bin/aria2c
PRG_BREW=/usr/local/bin/brew
PRG_SUDO=/usr/bin/sudo
PRG_LAUNCHCTL=/bin/launchctl

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

# dnscrypt-proxy
cp "${PWD}/resources/${ETC_DNSCRYPT_CONF}" "${DIR_DNSCRYPT}/${ETC_DNSCRYPT_CONF}"
output=$(${PRG_SUDO} ${PRG_BREW} services restart dnscrypt-proxy 2>&1)
[ "$?" -ne 0 ] && echo $output

# Sublime Text
if [ -d "${DIR_SUBLIME_TEXT}" ]; then
  cp resources/Preferences.sublime-settings "$DIR_SUBLIME_TEXT/Preferences.sublime-settings"
  cp resources/Default\ \(OSX\).sublime-keymap "$DIR_SUBLIME_TEXT/Default (OSX).sublime-keymap"
  cp resources/Package\ Control.sublime-settings "$DIR_SUBLIME_TEXT/Package\ Control.sublime-settings"
fi

# VSCode
ln -fs "$PWD/.config/vscode/settings.json" "$DIR_VSCODE/settings.json"
