# # Stage 1: Install Dependencies
# FROM node:22-alpine as Deps
# WORKDIR /app
# COPY package.json pnpm-lock.yaml ./
# RUN npm i -g pnpm && pnpm fetch --frozen-lockfile

# # Stage 2: Build the Application
# FROM node:22-alpine as Builder
# WORKDIR /app
# COPY --from=Deps /app/node_modules ./node_modules
# COPY . .
# RUN npm run build

# # Stage 3: Run the Application (using standalone output)
# FROM node:22-alpine as Runner
# WORKDIR /app
# ENV NODE_ENV=production
# COPY --from=Builder /app/.next/standalone ./
# COPY --from=Builder /app/.next/static ./.next/static
# EXPOSE 4000
# CMD ["npm", "start"]

FROM node:22-alpine
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm i -g pnpm && pnpm fetch --frozen-lockfile
COPY . .
ENTRYPOINT [ "pnpm", "start" ]