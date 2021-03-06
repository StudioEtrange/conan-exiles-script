#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh

APP_MODLIST_PATH="$STEAM_APP_PATH/ConanSandbox/Mods"
APP_MODLIST_FILE="$APP_MODLIST_PATH/modlist.txt"

# TODO : do not work, select most recent archive file ?
tarballName="configBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
tarball2Name="savedConfigBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
#tarball3Name="modsBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"

mkdir -p $STEAM_APP_PATH/configBackups

# Restore backup, keep tarball just incase (Might autodelete later when we know they aren't really needed)
# temporarily commented out, need to test if configs in saved will suffice
echo "Restoring backup"
tar -zxvf $STEAM_APP_PATH/configBackups/$tarballName -C $STEAM_APP_PATH/ConanSandbox/Config
tar -zxvf $STEAM_APP_PATH/configBackups/$tarball2Name -C $STEAM_APP_PATH/ConanSandbox/Saved/Config/WindowsServer
#tar -zxvf $STEAM_APP_PATH/configBackups/$tarball3Name -C $STEAM_MOD_PATH .
#cp -f $STEAM_APP_PATH/configBackups/modlist_$(date +%Y-%m-%d_%H-%M).txt $APP_MODLIST_FILE

