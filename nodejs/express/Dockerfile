FROM node:15.8.0-alpine3.13
ENV NODE_ENV production
WORKDIR /app/commons
COPY commons .
WORKDIR /app/express
COPY ["express/package.json", "express/package-lock.json", "./"]
RUN ls && npm install --production
COPY express .
EXPOSE 8080
CMD npm start
