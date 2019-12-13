#!/bin/sh

STEAM_CMD_PATH="/home/nomorgan/steamcmd"
# Conan Exiles Dedicated Server
# https://steamdb.info/app/443030/
STEAM_APP_ID="443030"
# Conan Exiles
# https://steamdb.info/app/440900/
STEAM_APP_ID_BIS="440900"

STEAM_MOD_PATH="/home/nomorgan/Steam/steamapps/workshop/content/$STEAM_APP_ID_BIS"
STEAM_APP_PATH="/home/nomorgan/exiles"

APP_MOD_PATH="$STEAM_APP_PATH/ConanSandbox/Mods"
APP_MODLIST_FILE="$APP_MOD_PATH/modlist.txt"


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




