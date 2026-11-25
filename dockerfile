FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM base AS test
COPY . .
RUN npm test

FROM base AS production
COPY . .
ENV NODE_ENV=production
CMD ["node", "server.js"]
