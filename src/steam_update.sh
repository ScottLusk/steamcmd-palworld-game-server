#!/bin/bash

mkdir -p /home/steam/.steam/sdk64
su -c "${STEAMCMDDIR}/steamcmd.sh +login anonymous +app_update 1007 +quit" steam
cp '/home/steam/Steam/steamapps/common/steamworks/linux64/steamclient.so' /home/steam/.steam/sdk64/

su -c "${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit" steam
