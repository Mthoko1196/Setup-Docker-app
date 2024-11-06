# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy the HTML file to the Nginx default directory
COPY index.html /usr/share/nginx/html/index.html