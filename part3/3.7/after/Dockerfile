FROM node:alpine as build-stage

WORKDIR /courseinfo

COPY ./courseinfo/ ./

RUN npm install
RUN npm run build


FROM node:alpine

WORKDIR /app/build
COPY --from=build-stage /courseinfo/build/ ./

WORKDIR /app

RUN npm install -g serve && \
    adduser -D course && \
    chown -hR course ./build

USER course

CMD ["serve", "-s", "build"]