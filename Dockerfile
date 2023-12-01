FROM node:16 as builder
WORKDIR /workspace
COPY . .
RUN npm install --unsafe-perm=true --allow-root

FROM node:16-alpine
WORKDIR /workspace
COPY --from=builder /workspace .
RUN apk --update add git
CMD npm start
EXPOSE 3000
