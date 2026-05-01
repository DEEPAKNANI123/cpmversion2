# Step 1: Build stage
FROM node:20-alpine AS build

# Crete App Directory
Run mkdir -p /app

# Work Directory
WORKDIR /app

# Copy package files
COPY package*.json /app
COPY . /app

# Install dependencies
RUN npm install

# Copy full project
COPY . .

# Build the React app
RUN npm run build


# Step 2: Production stage
# FROM nginx:alpine

# Copy build files to nginx
# COPY --from=build /app/dist /usr/share/nginx/html

# Expose port
# EXPOSE 80

# Start nginx
# CMD ["nginx", "-g", "daemon off;"]