FROM node:17-alpine3.12
RUN echo "restart 2"
RUN mkdir -p /home/app

COPY ./app /home/app

WORKDIR /home/app

RUN apk add --no-cache git

COPY ./app/api-fix /etc/vinted-api

RUN yarn install && \
    cp /etc/vinted-ap/* /home/app/node_modules/vinted-api/*



RUN yarn build

CMD [ "yarn", "start" ]
