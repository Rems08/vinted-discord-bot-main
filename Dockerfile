FROM node:17-alpine3.12
RUN echo "restart 2"
RUN mkdir -p /home/app

COPY ./app /home/app

WORKDIR /home/app

RUN apk add --no-cache git

COPY ./app/vinted-api-local /etc/vinted-api-local
RUN cd /etc/vinted-api-local && npm install -S

RUN yarn install



RUN yarn build

CMD [ "yarn", "start" ]
