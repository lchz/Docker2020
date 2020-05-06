FROM ubuntu:16.04

WORKDIR /backend

RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs

COPY ./backend-example-docker/ ./

RUN npm install

EXPOSE 8000

CMD ["npm", "start"]
