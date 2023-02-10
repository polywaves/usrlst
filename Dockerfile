FROM node:latest

ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /usr/src/app

CMD npm i && npm run dev
