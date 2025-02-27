# Use official Node.js 20 Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /myapp

# Copy only package.json and package-lock.json first (for better caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install  --force

# Copy rest of the application files
COPY . .

# Expose the application port
EXPOSE 3000

# Set default command
CMD ["npm", "start"]





