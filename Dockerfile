#Dependencias de desarrollo
FROM node:19.2-alpine3.16 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

#Builder y test
FROM node:19.2-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

#Dependencias de produccion
FROM node:19.2-alpine3.16 as deps-prod
WORKDIR /app
COPY package.json ./
RUN npm install --prod

#Ejecutar la app
FROM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=deps-prod /app/node_modules ./node_modules
COPY app.js ./
COPY tasks ./tasks
CMD [ "npm", "start" ]
