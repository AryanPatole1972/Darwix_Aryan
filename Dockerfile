# Base image for all services
FROM node:18-alpine AS base

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY packages/*/package.json ./packages/

# Install dependencies
RUN npm ci --only=production

# Development image
FROM base AS development

RUN npm ci

COPY . .

CMD ["npm", "run", "dev"]

# Build image
FROM base AS build

COPY . .

RUN npm ci && npm run build

# Production image
FROM node:18-alpine AS production

WORKDIR /app

ENV NODE_ENV=production

COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/packages ./packages

USER node

CMD ["node", "dist/index.js"]
