FROM node:7
MAINTAINER Patrick Scott <pat@patscott.io>

ENV NODE_ENV=development
ENV HOME=/home/

COPY package.json $HOME/service/
COPY yarn.lock $HOME/service/

WORKDIR $HOME/service/

RUN yarn global add node-gyp nodemon bunyan && yarn

CMD ["yarn", "start"]
HEALTHCHECK CMD curl --fail http://localhost:3000/ || exit 1

EXPOSE 3000