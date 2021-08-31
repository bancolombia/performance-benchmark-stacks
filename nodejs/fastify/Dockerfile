FROM node:15.8.0-alpine3.13
ENV NODE_ENV production
WORKDIR /app/commons
COPY commons .
RUN npm install --only=production
WORKDIR /app/fastify
COPY ["fastify/package.json", "fastify/package-lock.json", "./"]
RUN ls && npm install --production
COPY fastify .
EXPOSE 8080
CMD npm start
