FROM node:12-alpine AS base
WORKDIR /app

FROM base AS dependencies

COPY package.json yarn.lock ./
RUN yarn config set loglevel warn
COPY . /app

EXPOSE 80
CMD npm install && npm run run:forever