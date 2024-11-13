# Use Node 18 as parent image
FROM node:18

# Change the working directory on the Docker image to /app
WORKDIR /app

# Copy package.json and package-lock.json to the /app directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of project files into this image
COPY . .

ENV NEW_RELIC_NO_CONFIG_FILE=true
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LOG=stdout
ENV NEW_RELIC_LICENSE_KEY=
ENV NEW_RELIC_APP_NAME="yelpcamp"

# Expose application port
EXPOSE 3000

# Start the application
CMD npm start
