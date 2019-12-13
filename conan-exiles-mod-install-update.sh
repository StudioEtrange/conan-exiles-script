#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh


APP_MODLIST_PATH="$STEAM_APP_PATH/ConanSandbox/Mods"
APP_MODLIST_FILE="$APP_MODLIST_PATH/modlist.txt"


mkdir -p $APP_MOD_PATH
mkdir -p $STEAM_MOD_PATH

if [ "$1" = "" ]; then
	echo "usage : $0 <modlist file|mod id>"
	exit 1
fi

# Copy mod list
touch "$APP_MODLIST_FILE"
cp "$APP_MODLIST_FILE" "$APP_MODLIST_FILE.backup"
# Clear server modlist so we don't end up with duplicates
echo "" > $APP_MODLIST_FILE

if [ -f "$1" ]; then
	echo "Installing mods from $1 file"
	MODS=$(awk '{print $1}' $1)
	cat $1
else
	MODS="$1"
fi
for m in $MODS; do
	echo "Installing mod ID $m"
	$STEAM_CMD_PATH/steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +workshop_download_item $STEAM_APP_ID_BIS $m +quit
	res=$?
	if [ "$res" = "0" ]; then
		echo "OK. Adding mod file to $APP_MODLIST_FILE"
		find "$STEAM_MOD_PATH/$m" -iname '*.pak' >> $APP_MODLIST_FILE
	else
		echo "Failed. error $res"
	fi
done




