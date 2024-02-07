FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 2394010
ENV STEAMAPPDIR /home/steam/PalServer
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/Pal/Saved]
EXPOSE 8211

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		lib32gcc-s1 \
		lib32stdc++6 \
		lib32z1 \
		cron && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	su steam -c "${STEAMAPPDIR}/PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS"

ADD --chown=steam:steam --chmod=777 src ${STEAMSCRIPTDIR}
RUN ${STEAMSCRIPTDIR}/steam_update.sh
