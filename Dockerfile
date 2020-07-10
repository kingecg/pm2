ARG nodetag
FROM node:${nodetag}
USER root
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list \
    && apt-get update && apt install -y build-essential && apt-get install -y libavahi-compat-libdnssd-dev
RUN npm config set registry https://registry.npm.taobao.org 
RUN npm install node-gyp -g && npm install pm2 -g && pm2 install pm2-web
# RUN pm2 conf pm2-webshell:username waterchestnut
# RUN pm2 conf pm2-webshell:password waterchestnut
VOLUME ["/apps"]
WORKDIR /apps
CMD ["pm2-runtime","start","ecosystem.config.js"]