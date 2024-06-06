# Use a Node.js image as base
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files into the working directory
COPY package.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application files into the working directory
COPY . .

# Expose port 3000 on the container
ARG PORT=3000
EXPOSE ${PORT}

# Start the Next.js application
CMD ["npm", "run", "start"]
