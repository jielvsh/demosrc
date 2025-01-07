# Use the specified base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Expose the specified ports
EXPOSE 80

# Copy the application source code to the working directory
COPY dist/SLDC-Demo-Web2/ /usr/share/nginx/html

# Define the entry point or command to run the application
CMD ["nginx", "-g", "daemon off;"]
