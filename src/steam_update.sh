#!/bin/bash

mkdir -p /home/steam/.steam/sdk64
su -c "${STEAMCMDDIR}/steamcmd.sh +force_install_dir /home/steam/Steam/steamapps/common/steamworks +login anonymous +app_update 1007 +quit" steam
cp /home/steam/Steam/steamapps/common/steamworks/linux64/steamclient.so /home/steam/.steam/sdk64/

su -c "${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +app_update ${STEAMAPPID} validate +quit" steam
