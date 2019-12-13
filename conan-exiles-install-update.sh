#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh



mkdir -p $STEAM_APP_PATH
$STEAM_CMD_PATH/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir $STEAM_APP_PATH +login anonymous +app_update $STEAM_APP_ID validate +quit

