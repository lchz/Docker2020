FROM node

WORKDIR /courseinfo

COPY . .
RUN npm install

EXPOSE 5000

CMD ["npm", "run", "deploy"]