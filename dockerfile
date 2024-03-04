# Use Node.js
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json to the working directory
COPY package.json ./

# Copy pnpm-lock.yaml to the working directory
COPY pnpm-lock.yaml ./

# Install pnpm 
RUN npm install -g pnpm

# Install dependencies 
RUN pnpm install

# Copy application to working directory
COPY . .

# Build react
RUN pnpm run build

# Expose the port the app runs on
EXPOSE 3000

# Run builded version of react app
CMD ["pnpm", "run", "start"]
