FROM node:slim

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

EXPOSE 8787

ENTRYPOINT ["node_modules/.bin/wrangler", "dev", "--local", "--ip", "0.0.0.0"]