#!/bin/bash

echo SERVER_NAME $SERVER_NAME
echo SERVER_DETAIL $SERVER_DETAIL
echo SERVER_PASSWORD $SERVER_PASSWORD
echo REMOTE_ADDRESS $REMOTE_ADDRESS
echo MAX_PLAYERS $MAX_PLAYERS
echo DEATH_PENALTY $DEATH_PENALTY

mkdir -p ${STEAMAPPDIR}/Pal/Saved/Config/LinuxServer/ && cp ${STEAMAPPDIR}/DefaultPalWorldSettings.ini ${STEAMAPPDIR}/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
