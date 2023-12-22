FROM node:21-alpine

ENV DATABASE_URL $DATABASE_URL

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
COPY . .

RUN npx prisma migrate dev --name init
CMD [ "npm", "run", "dev" ]