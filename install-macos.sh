#!/usr/bin/env bash

set -e
set -u

DIR_SUBLIME_TEXT=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

# Sublime Text
if [ -d "$DIR_SUBLIME_TEXT" ]; then
    cp resources/Preferences.sublime-settings "$DIR_SUBLIME_TEXT/Preferences.sublime-settings"
    cp resources/Default\ \(OSX\).sublime-keymap "$DIR_SUBLIME_TEXT/Default (OSX).sublime-keymap"
    cp resources/Package\ Control.sublime-settings "$DIR_SUBLIME_TEXT/resources/Package Control.sublime-settings"
fi
