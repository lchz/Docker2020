FROM node:alpine as build-stage

WORKDIR /frontend
COPY ./frontend-example-docker ./

RUN npm install
RUN npm run build

FROM node:alpine

WORKDIR /app/dist
COPY --from=build-stage /frontend/dist/ ./

RUN npm install -g serve

WORKDIR /app

CMD ["serve", "-s", "-l", "5000", "dist"]