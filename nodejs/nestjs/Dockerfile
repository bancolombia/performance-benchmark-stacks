FROM node:15.8.0-alpine3.13 As development
WORKDIR /app
COPY package*.json ./
RUN npm install --only=development
COPY . .
RUN npm run build

FROM node:15.8.0-alpine3.13 as production
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
COPY package*.json ./
RUN npm install --only=production
COPY --from=development /app/dist ./dist
CMD ["node", "dist/main"]