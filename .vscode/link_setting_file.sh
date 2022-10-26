#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

##############
# mac
# VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User
# linux
VSCODE_SETTING_DIR=~/.config/Code/User

echo "Linking settings.json"
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"