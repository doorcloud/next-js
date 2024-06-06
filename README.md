# Launching a Next JS (JavaScript) Application with Docker

This guide explains how to set up and launch a Next JS (JavaScript) application using Docker.

## Prerequisites

Before starting, ensure you have the following tools installed on your machine:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Next JS](https://nextjs.org/docs)

## Dockerfile Content

This repository contains a Docker setup for a Next application.

```Dockerfile
# Use the official Node.js image as a base
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy necessary files to install dependencies
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port specified via an argument (default: 3000)
ARG PORT=3000
EXPOSE ${PORT}

# Command to start the application
CMD ["npm", "run", "start:prod"]

```
## Steps to Launch the Application

1. Build the Docker Image

To build the Docker image, use the following command in the directory containing the Dockerfile:

```
docker build -t door-next .
```

2. Run the Container

Once the image is built, run a container from this image:

```
docker run -p 8080:3000 door-next
```

3. Access the Application

Open your browser and go to the following URL to see your application running:

```
http://localhost:8080
```

4. Environment Variables

If you need to configure additional environment variables, modify the .env file that was copied into the container during the image build.

## Publishing the Image on Docker Hub

1. Log In to Docker Hub

Before publishing your image, log in to Docker Hub with your Docker account:

```
docker login
```

2. Tag the Image

Tag the image you built with your Docker Hub username and the image name:

```
docker tag door-next your_dockerhub_username/door-next:latest
```
Replace your_dockerhub_username with your Docker Hub username.

3. Push the Image to Docker Hub

Push the tagged image to Docker Hub:

```
docker push your_dockerhub_username/door-next:latest
```

