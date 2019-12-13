#!/bin/sh
STEAM_CMD_PATH="/home/nomorgan/steamcmd"
STEAM_APP_ID="443030"
STEAM_APP_PATH="/home/nomorgan/exiles"


mkdir -p $STEAM_APP_PATH
$STEAM_CMD_PATH/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir $STEAM_APP_PATH +login anonymous +app_update $STEAM_APP_ID validate +quit

