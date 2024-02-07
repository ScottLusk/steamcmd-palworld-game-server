#!/bin/bash

su steam -c "${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +app_update ${STEAMAPPID} validate +quit"
