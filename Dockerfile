FROM node:latest

MAINTAINER KasperFranz, <kasper@franz.guru>

WORKDIR /srv/daemon

RUN apt-get update \
 && apt-get install unzip \
 && wget -O daemon.tar.gz https://github.com/Pterodactyl/Daemon/archive/v0.4.2.tar.gz \
 && tar --strip-components=1 -xzvf daemon.tar.gz \
 && npm install --production \
 && rm -rf /node-${VERSION}.tar.gz /SHASUMS256.txt.asc /node-${VERSION} ${RM_DIRS} \
 /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
 /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

EXPOSE 8080

CMD ["npm", "start"]
