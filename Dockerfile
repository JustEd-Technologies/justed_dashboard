# Use the official Node.js image based on Alpine Linux as the base image for the build stage
FROM node:18-alpine AS builder

# Create directories /app and /app/data in the container's filesystem
RUN mkdir /app && mkdir /app/data

# Copy all files from the current directory on the host machine to the /app directory in the container
COPY . /app

# Change the working directory to /app, install dependencies using yarn, and build the application
RUN cd /app && yarn install && yarn build


# Use the official Node.js image based on Alpine Linux as the base image for the final stage
FROM node:18-alpine

# Create the /app directory in the container's filesystem
RUN mkdir /app

# Copy the built application from the builder stage to the /app/build directory in the final image
COPY --from=builder /app/build /app/build
# Copy the package.json and yarn.lock files from the builder stage to the /app directory in the final image
COPY --from=builder /app/package.json /app/yarn.lock /app/

# Change the working directory to /app, install production dependencies using yarn, and clean the yarn cache
RUN cd /app && \ 
  yarn install --production && \
  yarn cache clean

# Set the working directory to /app
WORKDIR /app

# Specify the command to run the application when the container starts
CMD ["node", "build/index.js"]
