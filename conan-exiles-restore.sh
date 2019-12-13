#!/bin/sh
STEAM_CMD_PATH="/home/nomorgan/steamcmd"
STEAM_APP_ID="443030"
STEAM_APP_PATH="/home/nomorgan/exiles"

tarballName="configBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
tarball2Name="savedConfigBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"

mkdir -p $STEAM_APP_PATH/configBackups

# Restore backup, keep tarball just incase (Might autodelete later when we know they aren't really needed)
# temporarily commented out, need to test if configs in saved will suffice
echo "Restoring backup"
tar -zxvf $STEAM_APP_PATH/configBackups/$tarballName -C $STEAM_APP_PATH/ConanSandbox/Config
tar -zxvf $STEAM_APP_PATH/configBackups/$tarball2Name -C $STEAM_APP_PATH/ConanSandbox/Saved/Config/WindowsServer

