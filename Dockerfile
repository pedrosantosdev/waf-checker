FROM node:slim

## Avoid error while downloading payload from github
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

EXPOSE 8787

ENTRYPOINT ["node_modules/.bin/wrangler", "dev", "--local", "--ip", "0.0.0.0"]