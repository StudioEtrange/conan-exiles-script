#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"

. $_CURRENT_FILE_DIR/conf.sh

# nohup -- /home/nomorgan/conan-exiles.sh 1>/home/nomorgan/conan-exiles.log 2>&1 &
export WINEARCH=win64
export WINEPREFIX=/home/nomorgan/.wine64

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $STEAM_APP_PATH/ConanSandboxServer.exe -log -Port=27030 -QueryPort=27015
