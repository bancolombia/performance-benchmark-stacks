FROM node:15.8.0-alpine3.13
ENV NODE_ENV production
COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production
COPY . .
EXPOSE 8080
CMD npm start