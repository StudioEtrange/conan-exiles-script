#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"
STELLA_LOG_STATE="OFF"
. $_CURRENT_FILE_DIR/stella-link.sh include


. $_CURRENT_FILE_DIR/conf.sh


CONFIG_PATH="$STEAM_APP_PATH/ConanSandbox/Saved/Config/WindowsServer"


mkdir -p $CONFIG_PATH

if [ "$1" = "" ]; then
	echo "usage : $0 <server password> <admin password>"
	exit 1
fi
if [ "$2" = "" ]; then
	echo "usage : $0 <server password> <admin password>"
	exit 1
fi


# password to access server in OnlineSubsystem section
touch $CONFIG_PATH/Engine.ini
$STELLA_API add_key "$CONFIG_PATH/Engine.ini" "OnlineSubsystem" "ServerPassword" "$1"

# admin password to get admin right in ServerSettings section
$STELLA_API add_key "$CONFIG_PATH/ServerSettings.ini" "ServerSettings" "AdminPassword" "$2"


echo "You need to reboot server"
