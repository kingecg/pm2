ARG nodetag
FROM node:${nodetag}
ARG osver
USER root
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo "deb http://mirrors.163.com/debian/ ${osver} main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.163.com/debian/ ${osver} main non-free contrib" >>/etc/apt/sources.list \
    && apt-get update && apt install -y build-essential && apt-get install -y --no-install-recommends libavahi-compat-libdnssd-dev
# RUN useradd --create-home --no-log-init --shell /bin/bash pm2 && adduser pm2 sudo
# USER pm2
RUN npm config set registry https://registry.npm.taobao.org 
RUN npm install node-gyp -g && npm install pm2@3.5.1 -g && export USER=root &&  export npm_config_loglevel=http; export npm_config_spin=false && npm install pm2-web -g  --unsafe
# RUN pm2 conf pm2-webshell:username waterchestnut
# RUN pm2 conf pm2-webshell:password waterchestnut
VOLUME ["/apps"]
WORKDIR /apps
CMD ["pm2-runtime","start","ecosystem.config.js"]