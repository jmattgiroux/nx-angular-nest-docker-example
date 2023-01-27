FROM node:12

WORKDIR /app

RUN yarn nx build angular-nest-docker-example 
RUN yarn nx build api

# install and cache app dependencies
COPY package.json yarn.lock ./
RUN yarn install --production

# add app
COPY ./dist/ ./

# start app
CMD node apps/server/main.js
