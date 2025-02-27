# Step 1: Use Node.js to build the app
FROM node:18-alpine AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --legacy-peer-deps

COPY . .
RUN npm run build

# Step 2: Use Node.js to serve the React app
FROM node:18-alpine

WORKDIR /app

# Install a simple Express server
RUN npm install -g serve

# Copy the built files from the previous stage
COPY --from=build /app/build .

# Expose port 3000
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", ".", "-l", "3000"]
