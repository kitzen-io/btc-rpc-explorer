FROM node:16-alpine

WORKDIR /workspace

COPY . .

RUN yarn --frozen-lockfile

CMD ["yarn", "run", "start"]

EXPOSE 3000
