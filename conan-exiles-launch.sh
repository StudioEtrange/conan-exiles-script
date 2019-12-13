#!/bin/sh

STEAM_APP_PATH="/home/nomorgan/exiles"

# nohup -- /home/nomorgan/conan-exiles.sh 1>/home/nomorgan/conan-exiles.log 2>&1 &
export WINEARCH=win64
export WINEPREFIX=/home/nomorgan/.wine64

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $STEAM_APP_PATH/ConanSandboxServer.exe -log -Port=27030 -QueryPort=27015
