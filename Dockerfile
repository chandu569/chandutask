FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/chandu569/chandutask.git

FROM 3apaxicom/npx as build
WORKDIR /app
COPY --from=clone /app /app
RUN npx create-react-app react-app

FROM node:11.15.0-alpine as deploy
WORKDIR /app
COPY --from=build /app/react-app/ /app
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]
