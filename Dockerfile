FROM node:slim

WORKDIR /app

RUN apt update && \
    apt install -y curl && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install --production

COPY . .

RUN chmod +x index.js

EXPOSE 3000

CMD ["node", "index.js"]
