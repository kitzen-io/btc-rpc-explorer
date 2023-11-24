FROM node:16 as builder
WORKDIR /workspace
COPY . .
RUN npm install -g npm@10.2.4 \
    && npm ci

FROM node:16-alpine
WORKDIR /workspace
COPY --from=builder /workspace .
RUN apk --update add git \
    && chown -R node:node /workspace  # Change ownership to the 'node' user
USER node  # Switch to the 'node' user
CMD npm start
EXPOSE 3002
