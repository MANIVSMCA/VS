FROM node:16 as build

WORKDIR /app

#COPY package.json index.js env ./
COPY . .

RUN npm install

FROM node:alpine as main

COPY --from=build /app /

EXPOSE 8080

CMD [ "node", "index.js" ]

#CMD ["index.js"]
