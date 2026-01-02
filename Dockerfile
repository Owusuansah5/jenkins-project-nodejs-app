FROM node:20-alpine
RUN apk add --no-cache libatomic
RUN mkdir -p /usr/app
COPY app/* /usr/app

WORKDIR /usr/app

RUN npm install
EXPOSE 3000
CMD ["node", "server.js"]
