FROM alpine:3.10

RUN apk add --update nodejs-current npm

RUN addgroup -S node && adduser -S node -G node

USER node

RUN mkdir /home/node/code

WORKDIR /home/node/code

COPY --chown=node:node package.json ./

RUN npm i

COPY --chown=node:node . .

CMD ["node", "index.js"]