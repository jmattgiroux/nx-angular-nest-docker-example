FROM node:12

WORKDIR /app
RUN pwd

RUN yarn nx build angular-nest-docker-example 
RUN pwd

RUN yarn nx build api

RUN pwd

# install and cache app dependencies
COPY package.json yarn.lock ./
RUN yarn install --production

# add app
COPY ./dist/ ./

# start app
CMD node apps/server/main.js
