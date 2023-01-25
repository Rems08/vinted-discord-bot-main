FROM node:17-alpine3.12
RUN echo "restart 2"
RUN mkdir -p /home/app

COPY ./app /home/app

WORKDIR /home/app

RUN apk add --no-cache git

COPY ./app/api-fix/index.js /etc/index.js

RUN yarn install && \
    cp /etc/index.js /home/app/node_modules/vinted-api/index.js



RUN yarn build

CMD [ "yarn", "start" ]
