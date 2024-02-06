FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 2394010
ENV STEAMAPPDIR /home/steam/PalServer
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/Storage]
EXPOSE 8211

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		procps\
		locales \
		libicu67 \
		libgdiplus && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	cd ${STEAMAPPDIR} && \
	./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS

ADD src ${STEAMSCRIPTDIR}
RUN ls ${STEAMSCRIPTDIR} -l
RUN ${STEAMSCRIPTDIR}/steam_update.sh
