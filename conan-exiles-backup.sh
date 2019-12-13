#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh

APP_MODLIST_PATH="$STEAM_APP_PATH/ConanSandbox/Mods"
APP_MODLIST_FILE="$APP_MODLIST_PATH/modlist.txt"

# TODO : save mods only if an option is passed (because backup mods take times)
# Backup configuration files
echo "Backing up configuration files"

# TODO : fix the same date for all backup files
tarballName="configBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
tarball2Name="savedConfigBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
#tarball3Name="modsBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"

mkdir -p $STEAM_APP_PATH/configBackups
tar -zcvf $STEAM_APP_PATH/configBackups/$tarballName -C $STEAM_APP_PATH/ConanSandbox/Config .
tar -zcvf $STEAM_APP_PATH/configBackups/$tarball2Name -C $STEAM_APP_PATH/ConanSandbox/Saved/Config/WindowsServer .
#tar -zcvf $STEAM_APP_PATH/configBackups/$tarball3Name -C $STEAM_MOD_PATH .
#cp -f $APP_MODLIST_FILE $STEAM_APP_PATH/configBackups/modlist_$(date +%Y-%m-%d_%H-%M).txt
