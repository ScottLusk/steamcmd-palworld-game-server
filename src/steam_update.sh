#!/bin/bash

mkdir -p ~/.steam/sdk64/
su -c "${STEAMCMDDIR}/steamcmd.sh
		+login anonymous
		+app_update 1007
		+quit" steam
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

su -c "${STEAMCMDDIR}/steamcmd.sh \
		+login anonymous \
		+force_install_dir ${STEAMAPPDIR} \
		+app_update ${STEAMAPPID} validate \
		+quit" steam
