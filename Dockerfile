FROM node:18.17

WORKDIR /usr/app

COPY ./package.json ./yarn.lock

RUN yarn --frozen-lockfile

COPY . .

CMD ["yarn", "run", "start"]
