#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh

# TODO : backup mods
# Backup configuration files
echo "Backing up configuration files"

tarballName="configBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
tarball2Name="savedConfigBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"

mkdir -p $STEAM_APP_PATH/configBackups
tar -zcvf $STEAM_APP_PATH/configBackups/$tarballName -C $STEAM_APP_PATH/ConanSandbox/Config .
tar -zcvf $STEAM_APP_PATH/configBackups/$tarball2Name -C $STEAM_APP_PATH/ConanSandbox/Saved/Config/WindowsServer .


