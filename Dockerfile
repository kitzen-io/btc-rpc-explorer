FROM node:16 as builder
WORKDIR /workspace
COPY . .
RUN npm ci

FROM node:16-alpine
WORKDIR /workspace
COPY --from=builder /workspace .
RUN apk --update add git
CMD npm start
EXPOSE 3002
